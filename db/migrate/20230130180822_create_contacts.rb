class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :document_number
      t.string :email
      t.date :birthday

      t.timestamps
    end
  end
end
