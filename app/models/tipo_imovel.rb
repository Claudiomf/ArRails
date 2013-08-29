class TipoImovel < ActiveRecord::Base
  
  # Tipos que estarão no banco
  APARTAMENTO = 1
  CASA = 2
  PONTO_COMERCIAL = 3
  TERRENO = 4
  
  has_many :imovels
  
end
