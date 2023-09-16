require 'rails_helper'

RSpec.describe "topics/show", type: :view do
  before(:each) do
    assign(:topic, Topic.create!(
      name: "Name",
      description: "Description",
      publication_year: 2,
      published_by: "Published By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Published By/)
  end
end
