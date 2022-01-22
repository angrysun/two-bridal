class ChangeReviewDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :rating, :integer, default: 1
  end
end
