class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :surname
      t.string :name_patronymic
      t.text :about
      t.integer :phone
      t.string :address
      t.integer :fax
      t.string :email
      t.string :skype
      t.string :site
      t.references :user, index: true

      t.timestamps
    end
  end
end
