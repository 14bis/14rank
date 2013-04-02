class CreateSpreeReviews < ActiveRecord::Migration
  def change
    create_table :spree_reviews do |t|
      t.integer :user_id
      t.integer :rating
      t.string :location
      t.string :title
      t.text :comment
      t.timestamps
      t.string :type
      t.integer :product_id
      t.integer :provider_id
    end
  end
end
