class CreateTodosections < ActiveRecord::Migration
  def change
    create_table :todosections do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
