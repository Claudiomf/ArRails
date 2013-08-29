class Pessoa < ActiveRecord::Base
  # tipos de pessoa
  JURIDICA = 1
  FISICA   = 2
  
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, :allow_destroy => true
  
  attr_accessible :nome, :telefone1, :telefone2, :endereco_attributes
end
