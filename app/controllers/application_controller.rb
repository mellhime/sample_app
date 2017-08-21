class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_login

	private

	  def require_login
	    unless current_user
	    flash[:notice] = "Please sign in."
	      redirect_to '/signin'
	    end
	  end
end
