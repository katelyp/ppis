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

    event :re_register do
      transition :from => :declined, :to => :registered
    end
  end

end
