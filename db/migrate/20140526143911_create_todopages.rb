class CreateTodopages < ActiveRecord::Migration
  def change
    create_table :todopages do |t|
      t.string :title
      t.references :todosection, index: true

      t.timestamps
    end
  end
end
