class Review < ApplicationRecord
  validates_presence_of :rating, :movie, :created_at
  belongs_to :user
end
