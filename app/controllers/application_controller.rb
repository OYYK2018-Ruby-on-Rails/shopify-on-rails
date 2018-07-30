class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def seed
    Rails.application.load_seed
    redirect_to root_path
  end
end
