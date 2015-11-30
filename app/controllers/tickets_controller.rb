class TicketsController < ApplicationController
  layout 'application'

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
    @shows = Show.all
  end

  def create
    seat_cred = params[:ticket][:seat_id].split('/')
    @show = Show.find(params[:ticket][:show_id])
    @seat = @show.seats.where(row: seat_cred[0].to_i, place: seat_cred[1].to_i).first
    @ticket = Ticket.new(
      show_id: @show.id,
      seat_id: @seat.id,
      user_name:  params[:ticket][:user_name]
      )
    if @ticket.valid?
      @ticket.save
      @seat.availability = false
      @seat.save
      redirect_to ticket_path(@ticket), flash: { success: 'You acquired a ticket!' }
    else
      render 'new'
    end
  end
end
