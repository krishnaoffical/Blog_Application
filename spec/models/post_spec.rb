# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "associations" do
    it "belongs to a topic" do
       belongs_to(:topic)
    end


    it "has many ratings with dependent destroy" do
      should have_many(:ratings).dependent(:destroy)
    end

    it "has many comments with dependent destroy" do
      should have_many(:comments).dependent(:destroy)
    end

    it "has and belongs to many tags" do
      should have_and_belong_to_many(:tags)
    end

    it "has one attached image" do
      should have_one_attached(:image)
    end

    it "belongs to a user" do
      should belong_to(:user)
    end

    it "has and belongs to many users with a custom join table" do
      should have_and_belong_to_many(:users).join_table('posts_users_read_statuses')
    end
  end

  describe "methods" do
    it "checks if it is read by a user" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)

      expect(post.read_by?(user)).to be(false)

      post.users << user

      expect(post.read_by?(user)).to be(true)
    end
  end
end
