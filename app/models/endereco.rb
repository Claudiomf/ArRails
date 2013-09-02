# encoding: utf-8
class Endereco < ActiveRecord::Base

  belongs_to :pessoa, foreign_key: :pessoa_id
  
  #validates :logradouro, :bairro, :cidade, presence: true
  
  validates :logradouro, :presence => { :message => "Logradouro não pode ficar em branco." }
  validates :bairro, :presence => { :message => "Bairro não pode ficar em branco." }
  validates :cidade, :presence => { :message => "Cidade não pode ficar em branco." }

  attr_accessible :logradouro, :bairro, :cidade, :pessoa_id

end
