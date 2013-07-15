class ImovelDetalhe < ActiveRecord::Base
  has_and_belongs_to_many :imovels
end
