class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
end
