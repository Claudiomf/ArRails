class ItemImovel < ActiveRecord::Base
  belongs_to :caracteristica_imovel
  belongs_to :imovel
end
