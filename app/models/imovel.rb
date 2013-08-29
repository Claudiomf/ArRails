# encoding: utf-8
class Imovel < ActiveRecord::Base
  
  ADMIN_ROOT_ID = 1
  
  has_many :images, :dependent => :destroy
  # belongs_to :corretors
  
  # belongs_to :vendedor, :class_name => 'Corretor', :foreign_key => 'vendedor_id'
  # belongs_to :cadastrador, :class_name => 'Corretor', :foreign_key => 'cadastrador_id'
  
  belongs_to :vendedor, :class_name => 'Corretor', :foreign_key => 'vendedor_id'
  belongs_to :cadastrador, :class_name => 'Corretor', :foreign_key => 'cadastrador_id'
  
  has_many :item_imovels
  has_many :caracteristica_imovels, through: :item_imovels
  
  belongs_to :tipo_imovel, foreign_key: :tipo_imovel_id
  belongs_to :transacao_imovel, foreign_key: :transacao_imovel_id
  
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
  
  validates :tipo_imovel_id, :nome, :localizacao, :transacao_imovel_id, presence: true
  
  before_save :conferir_dados
  
  after_save :incrementa_contador_tipo_imovel
  
  attr_accessible :codigo_referencia, :nome, :localizacao, :descricao, :taxa_condominio, :iptu, 
                  :area, :vagas_garagem, :transacao_imovel_id, 
                  :tipo_imovel_id, :vendido, :ativo, :images_attributes, :quantidade_quartos, 
                  :quantidade_suites, :valor, :item_imovel_ids, :caracteristica_imovel_ids, 
                  :cadastrador_id, :vendedor_id
                  

  # Metodo chamado depois de salvar o imovel, ele deve atualizar o contador do tipo_imovel                  
  def incrementa_contador_tipo_imovel
    # Traz o imovel cujo id é igual ao do campo tipo_imovel_id do imovel    
    tipo_imovel =  TipoImovel.find(tipo_imovel_id)
    
    tipo_imovel.increment!(:contador_tipo_imovel) if !tipo_imovel.nil?
  end
                    
  
  # bypass re-entering current password for edit
  def preencher_codigo_referencia
    
    # Recupera a quantidade que tem na coluna: contador_tipo_imovel 
    contador = contador_tipo_imovel
    
    # Gera o código e atribui ao atributos: :codigo_referencia
    gerar_codigo_referencia(contador)
  end
  
  def conferir_dados
    preencher_codigo_referencia
  end
  
  
  # Todos os métodos auxiliares estão aqui
  private
  
  # Método que retorna o valor da coluna 'contador_tipo_imovel'
  def contador_tipo_imovel
    
    teste = TipoImovel.where(id: self.tipo_imovel_id).limit(1).pluck(:contador_tipo_imovel)
    # SELECT people.id FROM people WHERE people.age = 21 LIMIT 5
    
    #teste = TipoImovel.find_by_sql "SELECT tipo.contador_tipo_imovel FROM tipo_imovels tipo WHERE tipo.id = "+ tipo_imovel_id.to_s
    return !teste.nil? ? teste[0] : 0
  end
  
  # Metodo para formatar os digitos do codigo de referencia
  def formata_digitos_codigo_referencia(contador)
    contador += 1
    valor_formatado = "0000"
    case contador.to_s.length
    when 1
      valor_formatado = "0000" + contador.to_s
    when 2
      valor_formatado = "000" + contador.to_s
    when 3
      valor_formatado = "00" + contador.to_s
    when 4
      valor_formatado = "0" + contador.to_s
    else
      valor_formatado += contador.to_s
    end
    
    return valor_formatado
  end
  
  # Testando!!
  # Método usado para gerar o código de referência de um imóvel baseado no tipo de imóvel escolhido no momento do cadastro.
  def gerar_codigo_referencia(contador_tipo_imovel)
    
    valor_formatado = formata_digitos_codigo_referencia(contador_tipo_imovel)
    
    case self.tipo_imovel_id
    when 1
      self.codigo_referencia = "AP"+valor_formatado
      #@imovel.attributes = {:codigo_referencia => "AP"+@numero_codigo_referencia}
    when 2
      self.codigo_referencia = "CA"+valor_formatado
      #@imovel.attributes = {:codigo_referencia => "CA"+@numero_codigo_referencia}
    when 3
      self.codigo_referencia = "PC"+valor_formatado
      #@imovel.attributes = {:codigo_referencia => "PC"+@numero_codigo_referencia}
    when 4
      self.codigo_referencia = "TE"+valor_formatado
      #@imovel.attributes = {:codigo_referencia => "TE"+@numero_codigo_referencia}
    else
      self.codigo_referencia = valor_formatado
    end
  end

end
