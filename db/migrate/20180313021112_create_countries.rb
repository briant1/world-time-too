class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :wikipedia_url
      t.string :name

      t.timestamps
    end
  end
end
