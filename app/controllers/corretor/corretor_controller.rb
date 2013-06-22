class Corretor::CorretorController < ApplicationController
  layout "corretor"
  before_filter :verify_corretor
  
   def verify_corretor
    :authenticate_user!
    redirect_to root_url unless has_role?(current_user, 'admin')
  end
  
  def current_ability
    @current_ability ||= CorretorAbility.new(current_user)
  end

end