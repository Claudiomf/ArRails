class User < ActiveRecord::Base
  usar_como_cpf :cpf
  has_and_belongs_to_many :roles
  
  belongs_to :corretor, foreign_key: :corretor_id
  
  # Teste, descomente estas linhas pra finalizar o teste
  # belongs_to :corretor, dependent: :destroy
  
  # Fim do teste, comente estas linhas
  #has_one :corretor
  #has_one :endereco, through: :corretor
  
  #accepts_nested_attributes_for :corretor, :allow_destroy => true
  #accept_nested_attributes_for :endereco, :allow_destroy => true
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
