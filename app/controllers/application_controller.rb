class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    user_not_authorized
    end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
