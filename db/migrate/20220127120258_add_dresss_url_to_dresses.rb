class AddDresssUrlToDresses < ActiveRecord::Migration[6.1]
  def change
    add_column :dresses, :dress_url, :string
  end
end
