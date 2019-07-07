class CreateLengthUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :length_urls do |t|
      t.integer :size, default: 1

      t.timestamps
    end
  end
end
