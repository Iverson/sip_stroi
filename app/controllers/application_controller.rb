class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_http_basic_auth if Rails.env == "production"
  before_filter :init_feedback

  def init_feedback
  	@feedback = ::Feedback.new
  end

  def require_http_basic_auth
    authenticate_or_request_with_http_basic 'Auth' do |name, password|
      name == 'sip_stroy' && password == 'qwerty'
    end
  end
end
