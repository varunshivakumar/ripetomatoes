class Review < ApplicationRecord
  validates_presence_of :rating, :movie
  belongs_to :user
end
