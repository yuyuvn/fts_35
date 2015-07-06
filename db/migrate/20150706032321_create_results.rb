class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :answer, index: true
      t.belongs_to :exam, index: true
      t.belongs_to :question, index: true
      
      t.timestamps null: false
    end
  end
end
