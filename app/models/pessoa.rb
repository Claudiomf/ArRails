class Pessoa < ActiveRecord::Base
  
  # tipos de pessoa
  JURIDICA = 1
  FISICA   = 2
  
  attr_accessible :nome, :telefone1, :telefone2
end
