# require 'rails_helper'
#
# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a unique email" do
    duplicate_user = user.dup
    expect(duplicate_user).to_not be_valid
  end

  it "is not valid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is not valid with a short password" do
    user.password = "short"
    expect(user).to_not be_valid
  end

  it "authenticates with a correct password" do
    expect(user.valid_password?(user.password)).to be_truthy
  end

  it "does not authenticate with an incorrect password" do
    expect(user.valid_password?("incorrect_password")).to be_falsey
  end

  it "has a valid email format" do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_emails.each do |email|
      user.email = email
      expect(user).to be_valid
    end
  end

  it "has an invalid email format" do
    invalid_emails = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_emails.each do |email|
      user.email = email
      expect(user).to_not be_valid
    end
  end

  it "is not valid without a unique email (case-insensitive)" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    expect(duplicate_user).to_not be_valid
  end

  # Test cases for Devise modules
  it "is not confirmable by default" do
    expect(user).to_not be_confirmed
  end

  it "is registerable by default" do
    expect(user).to be_registerable
  end

  it "is recoverable by default" do
    expect(user).to be_recoverable
  end

  it "is rememberable by default" do
    expect(user).to be_rememberable
  end

  it "is validatable by default" do
    expect(user).to be_validatable
  end

  # Add more test cases for custom methods or functionality as needed
end
