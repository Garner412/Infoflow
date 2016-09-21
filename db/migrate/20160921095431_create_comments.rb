class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer  :question_id
      t.integer  :answer_id
      t.string   :text, null: false

      t.timestamps(null: false)
    end
  end
end
