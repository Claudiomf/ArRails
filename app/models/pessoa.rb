# encoding: utf-8
class Pessoa < ActiveRecord::Base
  # tipos de pessoa
  JURIDICA = 1
  FISICA   = 2
  
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, :allow_destroy => true
  
  validates :nome, :telefone1, presence: true
  
  validates :nome, :presence => { :message => "Nome Completo não pode ficar em branco." }
  validates :telefone1, :presence => { :message => "Telefone não pode ficar em branco." }
  
  attr_accessible :nome, :telefone1, :telefone2, :endereco_attributes
end
