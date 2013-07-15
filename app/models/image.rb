class Image < ActiveRecord::Base
  attr_accessible :imovel_id, :image, :remote_image_url
  
  belongs_to :imovel
  mount_uploader :image, ImageUploader
end
