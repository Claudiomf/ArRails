class Corretor < ActiveRecord::Base
  
  #validates :nome, :cpf, :rg, :creci, :telefone1, presence: true
    
  attr_accessible :nome, :cpf, :rg, :creci, :telefone1, :telefone2
end
