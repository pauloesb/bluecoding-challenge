class RemoveUniqueToOriginalUrlFromUrls < ActiveRecord::Migration[5.2]
  def change
    change_column :urls, :original_url, :string, unique: false
  end
end
