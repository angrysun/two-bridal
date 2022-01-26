class RemoveDressUrlFromDresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :dresses, :dress_url, :string
  end
end
