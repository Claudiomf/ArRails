class Imovel < ActiveRecord::Base
  has_and_belongs_to_many :imovel_detalhes
  belongs_to :users
end
