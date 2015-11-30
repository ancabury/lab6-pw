class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.datetime :date
      t.integer :seat_id
      t.integer :ticket_id
    end
  end
end
