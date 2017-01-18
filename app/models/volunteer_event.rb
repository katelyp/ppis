class VolunteerEvent < ApplicationRecord
  include AASM

  belongs_to :event
  belongs_to :volunteer

  aasm :column => 'state' do
    state :created, :initial => true
    state :invited
    state :registered
    state :approved
    state :declined
    state :cancelled
    state :attended
    state :noshow

    event :invite do
      transitions :from => :created, :to => :invited
    end

    event :register do
      transitions :from => :created, :to => :registered
    end

    event :approve do
      transitions :from => [:invited, :registered], :to => :approved
    end

    event :decline do
      transitions :from => [:invited, :registered, :approved], :to => :declined
    end

    event :cancel do
      transitions :from => [:registered, :approved], :to => :cancelled
    end

    event :re_register do
      transitions :from => :cancelled, :to => :registered
    end

    event :attend do
      transitions :from => :approved, :to => :attended
    end

    event :noshow do
      transitions :from => :approved, :to => :noshow
    end
  end

end
