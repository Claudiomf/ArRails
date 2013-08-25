class Pessoa < ActiveRecord::Base
  # attr_accessor :nome
  
  has_one :endereco
  belongs_to :corretor, foreign_key: :corretor_id
    
  attr_accessible :nome
  
  #, :endereco_attributes
  
  #accepts_nested_attributes_for :endereco, :allow_destroy => true
  
  # Tipos de Pessoa
  JURIDICA = 1
  FISICA = 2
  
end
