class ApplicationController < ActionController::Base
  def seed
    Rails.application.load_seed
    redirect_to root_path
  end
end
