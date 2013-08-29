class TransacaoImovel < ActiveRecord::Base
  
  # Tipos de transacao que estão no banco
  ALUGUEL = 1
  VENDA = 2
  
  has_many :imovels
end
