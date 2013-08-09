# encoding: utf-8
class Corretor < ActiveRecord::Base
  validates :nome, :cpf, :rg, :creci, :telefone1, presence: true
  
  # teste. Comente estas linhas para finalizar o teste
  has_one :user, dependent: :destroy
  has_one :endereco, dependent: :destroy
  
  accepts_nested_attributes_for :endereco, :allow_destroy => true
  accepts_nested_attributes_for :user, :allow_destroy => true
    
  attr_accessible :nome, :cpf, :rg, :creci, :telefone1, :telefone2, :user_id, :endereco_attributes, :user_attributes
  
  #before_save :conferir_dados
  validate :conferir_dados
  
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
