class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 2, maximum: 255 }, presence: true

end
