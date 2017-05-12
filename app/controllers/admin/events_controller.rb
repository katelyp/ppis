class Admin::EventsController < Admin::BaseController

  before_action :prepare_event, only: [:show, :edit, :update, :publish, :cancel, :job_requirements]

  def index
    @events = Event.order(date: :desc, start_time: :desc)
  end

  def job_requirements
    @job_requirements = @event.job_requirements
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to [:admin, @event]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to [:admin, @event]
    else
      render 'edit'
    end
  end

  def publish
    @volunteers = Volunteer.joins(:preferred_centers).where('preferred_centers.center_id = ?', @event.center_id)
    @event.publish!
    if @volunteers = regular_volunteers
      NewEventMailer.Autoregister_volunteers(@event, @volunteers).deliver_later
    else
      NewEventMailer.notify_volunteers(@event, @volunteers.to_a).deliver_later
    end
    redirect_to admin_events_path, notice: "Succesfully publish event: #{@event.event_name}"
  end

  def cancel
    @event.cancel!
    redirect_to admin_events_path, notice: "Succesfully cancel event: #{@event.event_name}"
  end

  private

  regular_volunteers = @event.center.preferred_centers.map(&:volunteer.where(adhoc: nil))
  
  def prepare_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:center_id, :event_name, :description, :date, :start_time, :end_time, :location,
      :number_of_volunteers,
      job_requirements_attributes: [:id, :job_title, :number_of_volunteers, :description, :_destroy]
    )
  end
  
end
