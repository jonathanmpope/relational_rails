class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :format
      t.integer :questions
      t.boolean :complete
      
      t.timestamps 
    end
  end
end
