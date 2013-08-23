class Endereco < ActiveRecord::Base

  belongs_to :corretor, foreign_key: :corretor_id

  validates :logradouro, :bairro, :cidade, presence: true

  attr_accessible :logradouro, :bairro, :cidade, :estado, :corretor_id

end
