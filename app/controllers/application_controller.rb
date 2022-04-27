class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    current_user.admin? ? root_path : search_path
  end
end
