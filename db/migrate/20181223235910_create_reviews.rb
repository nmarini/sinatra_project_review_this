class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |i|
      i.string :name
      i.string :description
      i.integer :star_rating
      i.integer :user_id

    end
  end
end
