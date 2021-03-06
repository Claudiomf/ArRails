# encoding: utf-8
class PessoaFisica < Pessoa

  CORRETOR = 3
  
  #belongs_to :corretor, foreign_key: :corretor_id
  # teste. Comente estas linhas para finalizar o teste
  
  #has_one :user, dependent: :destroy
  #has_one :endereco, dependent: :destroy
  
  #accepts_nested_attributes_for :endereco, :allow_destroy => true
  #accepts_nested_attributes_for :user, :allow_destroy => true
  
  #validates :cpf, :rg, presence: true
  
  validates :cpf, :presence => { :message => "CPF não pode ficar em branco." }
  validates :rg, :presence => { :message => "RG não pode ficar em branco." }
  
  attr_accessible :cpf, :rg, :sexo
  
  default_scope :conditions => {:tipo => FISICA}
end
