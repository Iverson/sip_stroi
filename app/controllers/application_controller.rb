class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :init_feedback

  def init_feedback
  	@feedback = ::Feedback.new
    @feedback.build_user_info
  end
end
