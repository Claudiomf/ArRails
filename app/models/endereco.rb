class Endereco < ActiveRecord::Base

  belongs_to :pessoa_fisica, foreign_key: :pessoa_id
  
  validates :logradouro, :bairro, :cidade, presence: true

  attr_accessible :logradouro, :bairro, :cidade, :pessoa_id

end
