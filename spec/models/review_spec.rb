require 'rails_helper'

RSpec.describe Review, type: :model do
  user = User.new(
      name: "Admin",
      email: "admin@gmail.com",
      password: "test",
      password_confirmation: "test")
  user.save

  subject {
    Review.new(id: 1, comment: nil, user: user, movie: 1, rating: 2, created_at: Time.now)
  }

  it "is not valid with valid attributes" do
    expect(Review.new).to_not be_valid
  end

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a movie" do
    subject.movie = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a rating" do
    subject.rating = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a created_date" do
    subject.created_at = nil
    expect(subject).to_not be_valid
  end

  it "is valid without a comment" do
    expect(subject).to be_valid
  end
end
