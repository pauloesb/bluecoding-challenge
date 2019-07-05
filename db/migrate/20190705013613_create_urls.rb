class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :short_url
      t.string :title
      t.integer :access

      t.timestamps
    end
  end
end
