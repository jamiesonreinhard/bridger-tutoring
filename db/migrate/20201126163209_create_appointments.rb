class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.references :tutor, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
