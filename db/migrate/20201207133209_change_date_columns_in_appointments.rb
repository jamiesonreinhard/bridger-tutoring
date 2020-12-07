class ChangeDateColumnsInAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :date, :datetime
    add_column :appointments, :date, :date
    add_column :appointments, :time, :time
  end
end
