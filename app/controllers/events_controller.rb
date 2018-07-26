class EventsController < ApplicationController

  def new
    @event = Event.new
    @event.build_location(session[:location])
  end

  def create
    @event = Event.new(event_params)
    @event.location = find_or_create_location
    if @event.save
      Rsvp.create(user_id: params[:event][:user_id], event_id: @event.id)
      redirect_to user_event_path(@event.user, @event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])
    if @event.update(event_params)
      redirect_to user_event_path(@event.user, @event)
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  def index
    date_range  = Date.today..(Date.today+7)
    @events = Event.all.sort_by {|event| event.date}
    @recent_events = Event.most_recent(5)
    respond_to do |format|
       format.html { render :index }
       format.json { render json: @events }
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @comment = Comment.new
    respond_to do |format|
       format.html { render :show }
       format.json { render json: @event }
    end

  end

private


  def event_params
  params.require(:event).permit(
    :title,
    :date,
    :time,
    :description,
    :user_id,
    location_attributes: [
      :name,
      :address,
      :city,
      :state,
      :public,
      :user_id
    ],
    rsvp_attributes: [:user_id])
  end

  def find_or_create_location
    location = Location.find_or_create_by(
      name: params[:event][:location_attributes][:name],
      address: params[:event][:location_attributes][:address],
      city: params[:event][:location_attributes][:city],
      state: params[:event][:location_attributes][:state],
      public: params[:event][:location_attributes][:public],
      user_id: params[:event][:location_attributes][:user_id]
    )
  end
end
