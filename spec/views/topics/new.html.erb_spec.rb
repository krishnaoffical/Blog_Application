require 'rails_helper'

RSpec.describe "topics/new", type: :view do
  before(:each) do
    assign(:topic, Topic.new(
      name: "MyString",
      description: "MyString",
      publication_year: 1,
      published_by: "MyString"
    ))
  end

  it "renders new topic form" do
    render

    assert_select "form[action=?][method=?]", topics_path, "post" do

      assert_select "input[name=?]", "topic[name]"

      assert_select "input[name=?]", "topic[description]"

      assert_select "input[name=?]", "topic[publication_year]"

      assert_select "input[name=?]", "topic[published_by]"
    end
  end
end
