class CreateTaskComments < ActiveRecord::Migration[6.0]
  def change
    create_table :task_comments do |t|
      t.references :task, null: false, foreign_key: { on_delete: :cascade }
      t.string :comment, null: false
      t.string :image
      t.timestamps
    end
  end
end
