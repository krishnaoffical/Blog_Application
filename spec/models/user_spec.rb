# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_attributes) do
    {
      email: 'test@example.com',
      password: 'password123',
      # Add other user attributes as needed
    }
  end

  describe "associations" do
    it "has many posts" do
      user = User.create(user_attributes)
      post1 = user.posts.create(name: 'Post 1', content: 'Content 1')
      post2 = user.posts.create(name: 'Post 2', content: 'Content 2')

      # Ensure that the user has many posts
      expect(user.posts).to include(post1, post2)

    end
    end

  describe "Devise modules" do
    it "is database authenticatable" do
      user = User.create(user_attributes)
      expect(user.valid_password?("password123")).to be(true)
    end

    it "is registerable" do
      user = User.create(user_attributes)
      expect(user.valid?).to be(true)
    end

    it "is rememberable" do
      user = User.create(user_attributes)
      user.remember_me!
      expect(user.reload.remember_created_at).to_not be_nil
    end

    it "is validatable" do
      user = User.create(user_attributes.merge(email: nil))
      expect(user.valid?).to be(false)
    end end
  end
