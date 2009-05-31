# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

#require 'gettext/rails'

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  #init_gettext "electronic_projects"

  def image
    p = Photo.find( params[:id] )
    send_data( p.data, :filename => p.name, :type => p.format, :disposition => 'inline' )
  end

  def blob
    b = Blob.find( params[:id] )
    send_data( b.data, :filename => b.name, :type => b.format, :disposition => 'inline' )
  end
end
