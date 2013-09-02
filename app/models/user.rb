# encoding: utf-8
class User < ActiveRecord::Base
  usar_como_cpf :cpf
  has_and_belongs_to_many :roles
  
  #belongs_to :pessoa_fisica, foreign_key: :pessoa_id
  belongs_to :corretor, :class_name => 'Corretor', :foreign_key => 'corretor_id'
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#
         #, :validatable
         
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids 

  before_save :setup_role
  
  #before_destroy :verifica_corretor_associado

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # Default role is "Registered"
  def setup_role 
    if self.role_ids.empty?     
      self.role_ids = [2] 
    end
  end
  
  # bypass re-entering current password for edit
  def update_with_password(params={}) 
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    update_attributes(params) 

    clean_up_passwords
  end
  
  def verifica_corretor_associado
    if (Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.cadastrador_id = " +corretor.id.to_s) > 0
      return false
    end
    if (Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.vendedor_id = " +corretor.id.to_s) > 0
      return false
    end
  end
end
