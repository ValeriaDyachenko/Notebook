class CreateNotesections < ActiveRecord::Migration
  def change
    create_table :notesections do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
