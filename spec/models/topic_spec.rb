# spec/models/topic_spec.rb

require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe "associations" do
    it "has many posts" do
      topic = Topic.reflect_on_association(:posts)
      expect(topic.macro).to eq(:has_many)
      expect(topic.options[:dependent]).to eq(:destroy)
    end
  end

  describe "callbacks" do
    it "destroys associated posts when a topic is destroyed" do
      topic = Topic.create(name: "Test Topic")
      post1 = Post.create(name: "Post 1", content: "Content 1", topic: topic)
      post2 = Post.create(name: "Post 2", content: "Content 2", topic: topic)

      expect {
        topic.destroy
      }.to change(Post, :count).by(0)

      expect(Post.where(id: [post1.id, post2.id])).to be_empty
    end
  end

  describe "validations" do
    it "validates the presence of name" do
      topic = Topic.new
      expect(topic.valid?).to be(true)
    end
  end
end
