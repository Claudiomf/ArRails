class Corretor::CorretorController < ApplicationController
  layout "corretor"
  
  #before_filter :authenticate_user!
  
  before_filter :verify_admin

  def verify_admin
    authenticate_user!
    #redirect_to root_url unless has_role?(current_user, 'Admin')
  end
  
  def current_ability
    @current_ability ||= CorretorAbility.new(current_user)
  end

end