class PessoaFisica < Pessoa
  
  #has_one :endereco, dependent: :destroy
  
  #accepts_nested_attributes_for :endereco, :allow_destroy => true
  
  #validates :nome, :cpf, :rg, :telefone1, presence: true
  
  # attr_accessible :nome, :endereco_attributes
  attr_accessible :nome
  
  # Tipo de PessoaFisica
  # CORRETOR = 3
  
  default_scope :conditions => {:tipo => FISICA}
  
  #attr_accessor :cpf, :rg, :telefone1, :telefone1, :telefone2, :endereco_attributes
end
