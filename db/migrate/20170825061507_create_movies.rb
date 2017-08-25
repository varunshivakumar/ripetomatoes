class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.integer :db_id
      t.string :title
      t.text :summary
      # t.has_many :genres
      t.float :vote
      t.string :poster
      t.string :homepage
      t.string :release_date
      t.integer :runtime
      t.string :status
      t.string :tagline
      t.string :backdrop
      t.timestamps
    end
  end
end
