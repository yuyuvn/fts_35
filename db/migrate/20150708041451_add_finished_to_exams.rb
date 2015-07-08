class AddFinishedToExams < ActiveRecord::Migration
  def change
    add_column :exams, :finished, :boolean, default: false
  end
end
