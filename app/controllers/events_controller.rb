class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.image.attach(params[:image])

    if @event.save
      flash[:success] = 'Votre événement a bien été créé'
      redirect_to action: 'index'
    else
      flash[:error] = "Votre événement n'a pas pu être créé"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params['id'])
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end
end
