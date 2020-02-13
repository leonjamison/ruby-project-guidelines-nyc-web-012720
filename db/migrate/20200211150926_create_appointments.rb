class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :date
      t.integer :time
      t.integer :client_id
      t.integer :barber_id
    end 
  end
end
