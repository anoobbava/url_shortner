# migration to create the url_details

class CreateUrlDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :url_details do |t|
      t.string :short_url
      t.text :original_url
      t.timestamps
    end
  end
end
