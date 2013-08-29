class Endereco < ActiveRecord::Base

  belongs_to :pessoa, foreign_key: :pessoa_id
  # belongs_to :corretor, :class_name => 'Corretor', :foreign_key => 'corretor_id'
  
  validates :logradouro, :bairro, :cidade, presence: true

  attr_accessible :logradouro, :bairro, :cidade, :pessoa_id

end
