class AddInformationToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :city, :string
    add_column :tutors, :state, :string
    add_column :tutors, :country, :string
    add_column :tutors, :occupation, :string
    add_column :tutors, :phone_number, :string
    add_column :tutors, :linked_in_link, :string
  end
end
