class Ticket < ActiveRecord::Base
  belongs_to :seat
  belongs_to :show

  validates_presence_of :user_name, :show_id, :seat_id
  validate :seat_availability

  def seat_availability
    errors.add(:seat_id, "Seat is occupied") if !seat.availability
  end
end
