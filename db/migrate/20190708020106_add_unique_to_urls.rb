class AddUniqueToUrls < ActiveRecord::Migration[5.2]
  def change
    change_column :urls, :original_url, :string, unique: true
    change_column :urls, :short_url, :string, unique: true
  end
end
