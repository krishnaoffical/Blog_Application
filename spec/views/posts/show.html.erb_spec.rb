require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    assign(:post, Post.create!(
      name: "Name",
      content: "Content",
      topic: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(//)
  end
end
