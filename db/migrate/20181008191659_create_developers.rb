class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :github_username
      t.string :phone_number
      t.string :website
      t.integer :category
      t.string :country

      t.timestamps
    end
  end
end
