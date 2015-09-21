class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :provider
      t.string :token
      t.string :uid
      t.string :image_url

      t.timestamps null: false
    end
  end
end
