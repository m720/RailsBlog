class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 2, maximum: 255 }, presence: true
  validates :body, length: { minimum: 8, maximum: 2500 }, presence: true
end
