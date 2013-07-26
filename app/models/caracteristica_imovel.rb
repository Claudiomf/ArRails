class CaracteristicaImovel < ActiveRecord::Base
  has_many :item_imovels
  has_many :imovels, through: :item_imovels
  
  validates :descricao, length: { maximum: 300, too_long: "%{count} e o maximo de caracteres permitidos." }
  
  validates :descricao, uniqueness: {message: "ja foi cadastrada."}, presence: {message: "precisa ser preenchida."}
  
  attr_accessible :descricao, :contador
  
end
