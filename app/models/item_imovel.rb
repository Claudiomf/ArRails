class ItemImovel < ActiveRecord::Base
  belongs_to :caracteristica_imovel, foreign_key: :caracteristica_imovel_id
  belongs_to :imovel, foreign_key: :imovel_id
  
  attr_accessible :imovel_id
  
end
