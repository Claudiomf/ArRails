# encoding: utf-8
class CaracteristicaImovel < ActiveRecord::Base
  has_many :item_imovels
  has_many :imovels, through: :item_imovels
  
  validates :descricao, length: { maximum: 300, too_long: "%{count} é o máximo de caracteres permitidos." }
  
  validates :descricao, uniqueness: {message: "Esta característica já foi cadastrada."}, presence: {message: "Descrição não pode ficar em branco."}
  
  attr_accessible :descricao, :contador
  
end
