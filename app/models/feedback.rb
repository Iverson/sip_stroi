class Feedback < ActiveRecord::Base
  belongs_to :feedbackable, :polymorphic => true

  validates :name, presence: true
  validates :phone, presence: true
  validates :message, presence: true
end
