class ApplicationController < ActionController::Base
	before_action :zero_error
  def seed
    Rails.application.load_seed
    redirect_to root_path
  end

  private
  def zero_error
  	@zeros = Variant.where('stock < (?)', 1).destroy_all
  end
end
