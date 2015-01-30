class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to(request.referer + '#feedback', :flash => {:feedback_success => t('activerecord.flash.feedback_success')}) }
      else
        format.html { redirect_to(request.referer + '#feedback', :flash => {:feedback_error => t('activerecord.flash.feedback_error')}) }
      end
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :phone, :message)
  end
end
