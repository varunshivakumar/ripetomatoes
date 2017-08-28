require 'rails_helper'

RSpec.describe Review, type: :model do
  user = User.new(
      name: "Admin",
      email: "admin@gmail.com",
      password: "test",
      password_confirmation: "test")
  user.save

  it "is not valid with valid attributes" do
    expect(Review.new).to_not be_valid
  end

  it "is not valid without a user" do
    review = Review.new(id: 1, comment: nil, movie: 1, rating: 2, created_at: Time.now)
    expect(review).to_not be_valid
  end

  it "is not valid without a movie" do
    review = Review.new(id: 1, comment: nil, user: user, rating: 2, created_at: Time.now)
    expect(review).to_not be_valid
  end

  it "is not valid without a rating" do
    review = Review.new(id: 1, comment: nil, user: user, movie: 1, created_at: Time.now)
    expect(review).to_not be_valid
  end

  it "is not valid without a created_date" do
    review = Review.new(id: 1, comment: nil, user: user, movie: 1, rating: 2)
    expect(review).to_not be_valid
  end


  it "is valid without a comment" do
    review = Review.new(id: 1, comment: nil, user: user, movie: 1, rating: 2, created_at: Time.now)
    expect(review).to be_valid
  end
end
