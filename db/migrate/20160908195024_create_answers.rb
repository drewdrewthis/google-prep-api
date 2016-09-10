class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.references :question
    	t.string :title, null: false
    	t.timestamps
    end

    add_column :questions, :correct_answer_id, :integer
  end
end
