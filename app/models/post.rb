class Post < ApplicationRecord
  belongs_to :user

  # TODO: add edit history
  validates :title, length: { minimum: 2, maximum: 255 }, presence: true
  validates :body, length: { minimum: 8, maximum: 2500 }, presence: true

  scope :by_user_id, ->(user_id) { where(user_id)}
end
