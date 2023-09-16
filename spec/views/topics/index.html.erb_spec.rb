require 'rails_helper'

RSpec.describe "topics/index", type: :view do
  before(:each) do
    assign(:topics, [
      Topic.create!(
        name: "Name",
        description: "Description",
        publication_year: 2,
        published_by: "Published By"
      ),
      Topic.create!(
        name: "Name",
        description: "Description",
        publication_year: 2,
        published_by: "Published By"
      )
    ])
  end

  it "renders a list of topics" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Published By".to_s), count: 2
  end
end
