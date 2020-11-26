class AddSummaryToTutors < ActiveRecord::Migration[6.0]
  def change
    add_column :tutors, :summary, :string
  end
end
