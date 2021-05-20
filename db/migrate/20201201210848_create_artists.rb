class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :bio
      t.integer :rate
      t.string :location
      t.boolean :available
      t.string :profile_picture

      t.timestamps
    end
  end
end
