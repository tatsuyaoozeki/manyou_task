class ApplicationController < ActionController::Base
  # before_action :basic_auth
  protect_from_forgery with: :exception
  include SessionsHelper
end
