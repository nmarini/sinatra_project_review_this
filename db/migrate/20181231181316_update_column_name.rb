class UpdateColumnName < ActiveRecord::Migration
  def change
    rename_column :reviews, :star_rating, :rating
  end
end
