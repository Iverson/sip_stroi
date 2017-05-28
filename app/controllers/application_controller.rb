class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :init_feedback
  before_filter :check_meta
  before_filter :get_office
  before_filter :is_offer_exist

  def init_feedback
    @feedback = ::Feedback.new
    @feedback.build_user_info
  end

  def get_office
    @offices = Office.positioned
    @head_office = @offices.first
  end

  def check_meta
    if request.method == 'GET'
      page = Page.where(uri: request.path).first
      
      set_meta page.meta.attributes if page
    end
  end

  def is_offer_exist
    @is_offer_exist = Offer.exists?
  end

  def set_meta(params={})
    set_meta_tags title: params['title'], description: params['description'], keywords: params['keywords']
  end
end
