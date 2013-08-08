class Corretor < ActiveRecord::Base
  validates :nome, :cpf, :rg, :creci, :telefone1, presence: true
  
  # teste. Comente estas linhas para finalizar o teste
  has_one :user, dependent: :destroy
  has_one :endereco, dependent: :destroy
  
  accepts_nested_attributes_for :endereco, :allow_destroy => true
  accepts_nested_attributes_for :user, :allow_destroy => true
    
  attr_accessible :nome, :cpf, :rg, :creci, :telefone1, :telefone2, :user_id, :endereco_attributes, :user_attributes
  
  before_save :conferir_dados
  
  # Usado para preencher o número creci com 5 digitos.
  def conferir_dados
    if creci.length <= 6
      self.creci = "0"+creci      
    end
  end
end
