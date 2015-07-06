class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :correct_number, default: 0
      
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
  end
end
