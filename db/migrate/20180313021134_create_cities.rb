class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.boolean :has_dst
      t.string :wikipedia_url
      t.string :timezone
      t.string :city
      t.string :state
      t.decimal :lng
      t.decimal :lat
      t.integer :country_id

      t.timestamps
    end
  end
end
