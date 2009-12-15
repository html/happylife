# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  rescue_from 'Acl9::AccessDenied', :with => :access_denied
  rescue_from 'ActiveRecord::RecordNotFound', :with => :not_found
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def access_denied
    render :file => "#{RAILS_ROOT}/public/422.html", :status => 422 and return
  end

  def not_found
    render :file => "#{RAILS_ROOT}/public/404.html", :status => 404 and return
  end
end
