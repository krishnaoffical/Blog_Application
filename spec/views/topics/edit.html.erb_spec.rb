require 'rails_helper'

RSpec.describe "topics/edit", type: :view do
  let(:topic) {
    Topic.create!(
      name: "MyString",
      description: "MyString",
      publication_year: 1,
      published_by: "MyString"
    )
  }

  before(:each) do
    assign(:topic, topic)
  end

  it "renders the edit topic form" do
    render

    assert_select "form[action=?][method=?]", topic_path(topic), "post" do

      assert_select "input[name=?]", "topic[name]"

      assert_select "input[name=?]", "topic[description]"

      assert_select "input[name=?]", "topic[publication_year]"

      assert_select "input[name=?]", "topic[published_by]"
    end
  end
end
