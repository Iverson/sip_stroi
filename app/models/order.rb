class Order < ActiveRecord::Base
  include AASM

  has_one :user_info, as: :userable
  accepts_nested_attributes_for :user_info

  aasm :column => :state do
    state :recived, :initial => true
    state :confirmed
    state :paid
    state :canceled

    event :confirm do
      transitions :from => [:recived, :canceled], :to => :confirmed
    end

    event :pay do
      transitions :from => :confirmed, :to => :paid
    end

    event :cancel do
      transitions :to => :canceled
    end
  end
end
