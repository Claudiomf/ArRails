class CaracteristicaImovel < ActiveRecord::Base
  has_many :item_imovels
  has_many :imovels, through: :item_imovels
  
  attr_accessible :descricao, :contador
end
