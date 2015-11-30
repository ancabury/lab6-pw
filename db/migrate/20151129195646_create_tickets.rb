class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :show_id
      t.string :user_name
      t.integer :seat_id
    end
  end
end
