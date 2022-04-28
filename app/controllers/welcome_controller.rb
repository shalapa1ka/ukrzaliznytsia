class WelcomeController < ApplicationController
  before_action :check_admin, only: :index
  def index
  end

  protected

  def check_admin
    redirect_to search_path, alert: "You can't enter to admin panel" unless current_user.admin?
  end
end
