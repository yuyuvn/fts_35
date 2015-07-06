class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content

      t.belongs_to :category, index: true
      
      t.timestamps null: false
    end
  end
end
