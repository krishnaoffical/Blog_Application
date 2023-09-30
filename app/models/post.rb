class Post < ApplicationRecord
  belongs_to :topic
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  has_one_attached :image
  belongs_to :user
end
