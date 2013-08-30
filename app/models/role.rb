class Role < ActiveRecord::Base
  
  ADMIN = 1
  CORRETOR = 2
  
  has_and_belongs_to_many :users
end