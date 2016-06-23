class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :pay]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  def pay
    @event = Event.find(params[:event_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:stripeAmount],
      :description => 'Betalning av ' + @event.name,
      :currency    => 'sek'
    )

    redirect_to @event, notice: "Din biljett till " + @event.name + " har betalats"

    TicketMailer.ticket_mail(params[:stripeEmail], @event).deliver_later
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :last_reserv_date, :start_at, :end_at, :location, :image, :price)
    end
end
