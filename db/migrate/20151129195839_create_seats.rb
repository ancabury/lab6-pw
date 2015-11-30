class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :row
      t.integer :place
      t.boolean :availability
      t.integer :show_id
      t.integer :ticket_id
    end
  end
end
