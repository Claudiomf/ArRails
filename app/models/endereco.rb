class Endereco < ActiveRecord::Base

  # belongs_to :pessoa_fisica, foreign_key: :pessoa_id
  belongs_to :corretor, :class_name => 'Corretor', :foreign_key => 'corretor_id'
  
  validates :logradouro, :bairro, :cidade, presence: true

  attr_accessible :logradouro, :bairro, :cidade, :corretor_id

end
