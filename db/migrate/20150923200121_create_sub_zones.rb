class CreateSubZones < ActiveRecord::Migration
  def change
    create_table :sub_zones do |t|
      t.string :name
      t.references :zone, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
