class User < ActiveRecord::Base
  usar_como_cpf :cpf
  has_and_belongs_to_many :roles
  has_many :imovels
  belongs_to :corretor, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids, :corretor_id

  before_save :setup_role
  
  before_destroy :verifica_corretor_associado

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # Default role is "Registered"
  def setup_role 
    if self.role_ids.empty?     
      self.role_ids = [2] 
    end
  end
  
  def verifica_corretor_associado
    if (Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.responsavel_id = " +corretor.id.to_s) > 0
      return false
    end
    if (Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.cadastrado_por_id = " +corretor.id.to_s) > 0
      return false
    end
    if (Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.vendedor_id = " +corretor.id.to_s) > 0
      return false
    end
  end
end
