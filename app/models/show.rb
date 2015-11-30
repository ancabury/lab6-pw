class Show < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  has_many :seats, dependent: :destroy
  after_commit :add_seats

  def add_seats
    (1..10).each do |row|
      (1..10).each do |seat|
        seats << Seat.create(row: row, place: seat, availability: true)
      end
    end
  end
end
