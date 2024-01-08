# spec/models/comment_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) } # Assuming you have a User factory
  let(:topic) { create(:topic) } # Assuming you have a Topic factory
  let(:post) { create(:post, user: user, topic: topic) } # Assuming you have a Post factory

  it "is valid with valid attributes" do
    comment = Comment.new(
      post: post
    )
    expect(comment).to be_valid
  end

  it "is invalid without a user" do
    comment = Comment.new(
      post: post
    )
    expect(comment).to_not be_valid
  end

  it "is invalid without a post" do
    comment = Comment.new(
      user: user
    )
    expect(comment).to_not be_valid
  end

  it "belongs to a user" do
    association = Comment.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it "belongs to a post" do
    association = Comment.reflect_on_association(:post)
    expect(association.macro).to eq(:belongs_to)
  end
end
