class AddStartedAtToExams < ActiveRecord::Migration
  def change
    add_column :exams, :started, :boolean, default: false
    add_column :exams, :started_at, :datetime
  end
end
