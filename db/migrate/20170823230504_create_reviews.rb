class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.integer :rating
      t.string :comment
      t.integer :movie
      t.timestamps
    end
  end
end
