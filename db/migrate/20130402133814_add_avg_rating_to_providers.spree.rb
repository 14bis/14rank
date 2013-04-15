class AddAvgRatingToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :avg_rating, :float
  end
end