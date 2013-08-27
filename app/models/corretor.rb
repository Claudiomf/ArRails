# encoding: utf-8
class Corretor < PessoaFisica
  
  default_scope :conditions => {:tipo => CORRETOR}
  
  has_many :imovels
  #has_one :pessoa_fisica, dependent: :destroy
  
  #accepts_nested_attributes_for :pessoa_fisica, :allow_destroy => true
  
  attr_accessible :creci
  
  #before_save :conferir_dados
  #validate :conferir_dados
  
  # Usado para preencher o número creci com 5 digitos.
  def conferir_dados
    # Se o número creci for menor que 6, ele está incompleto
    #{ message: "ja foi cadastrada."}
    errors[:base] = "O CRECI: "+creci.to_s+ " não é válido." if creci.length != 6
    return creci.length == 6
    #if creci.length <= 6
      #self.creci = "0"+creci      
    #end
  end
end
