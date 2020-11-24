class AddInformationToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :city, :string
    add_column :students, :state, :string
    add_column :students, :country, :string
    add_column :students, :school, :string
  end
end
