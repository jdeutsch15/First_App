class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_path, :alert => exception.message
  end
  def current_ability
  @current_ability ||= Ability.new(current_student)
end
end
