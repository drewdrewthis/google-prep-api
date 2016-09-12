class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.string :title, null: false
    	t.boolean :deleted, null: false, default: false
    	t.number :integer
    	t.timestamps
    end
  end
end
