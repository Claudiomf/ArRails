class Imovel < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  belongs_to :users
  has_many :item_imovels
  has_many :caracteristica_imovels, through: :item_imovels
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
  
  attr_accessible :codigo_referencia, :nome, :localizacao, :descricao, :taxa_condominio, :iptu, 
                  :area, :vagas_garagem, :transacao_imovel_id, 
                  :tipo_imovel_id, :responsavel_id, :cadastrado_por_id, :vendedor_id,
                  :vendido, :ativo, :images_attributes, :quantidade_quartos, :quantidade_suites, :valor, :item_imovel_ids, :caracteristica_imovel_ids
end
