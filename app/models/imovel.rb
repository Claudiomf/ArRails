class Imovel < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  belongs_to :users
  has_many :item_imovels
  has_many :caracteristica_imovels, through: :item_imovels
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
  
  attr_accessible :codigo_referencia, :nome, :localizacao, :descricao, :taxa_condominio, :iptu, 
                  :area, :vagas_garagem, :item_imovel_ids, :imovel_transacao_id, 
                  :imovel_tipo_id, :responsavel_id, :cadastrado_por_id, :vendedor_id,
                  :vendido, :ativo, :images_attributes
end
