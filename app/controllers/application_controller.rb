class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :pages

  def pages
     @pages=Page.all
  end
end
