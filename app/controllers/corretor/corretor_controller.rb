class Corretor::CorretorController < ApplicationController
  #layout "corretor"
   
  def current_ability
    @current_ability ||= CorretorAbility.new(current_user)
  end

end