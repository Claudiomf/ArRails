class Corretor::CorretorController < ApplicationController
  layout "corretor"
  before_filter :authenticate_user!
  
  def current_ability
    @current_ability ||= CorretorAbility.new(current_user)
  end

end