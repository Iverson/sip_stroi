class Order < ActiveRecord::Base
  has_one :user_info, as: :userable
  accepts_nested_attributes_for :user_info

  after_initialize :set_initial_state

  def set_initial_state
    self.state ||= :recived
  end

  state_machine :state, :initial => :recived do
    state :recived
    state :confirmed
    state :paid
    state :canceled
    
    event :confirm do
      transition all - [:confirmed, :paid] => :confirmed
    end
    
    event :pay do
      transition :confirmed => :paid
    end
    
    event :cancel do
      transition all - [:canceled] => :canceled
    end
  end
end
