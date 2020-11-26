class ChangeAppointmentNullToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column :appointments, :student_id, :integer, :null => true
  end
end
