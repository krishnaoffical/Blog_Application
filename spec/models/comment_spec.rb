require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    it { should belongs_to(:post) }
  it 'sets the role to "user" by default' do
    user =create(:comment,content:"hi")
    expect(user.content).to eq('hi')
  end
end