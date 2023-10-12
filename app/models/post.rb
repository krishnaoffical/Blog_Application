class Post < ApplicationRecord
  validates :name, length: { maximum: 20 }
  belongs_to :topic
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  has_one_attached :image
  belongs_to :user
  has_and_belongs_to_many :users , join_table: 'posts_users_read_statuses'
  def read_by?(user)
    self.users.include?(user)
  end

end
