# frozen_string_literal: true

# Post Model
class Post < ApplicationRecord
  include Hashid::Rails

  belongs_to :user
  belongs_to :fluck

  has_many_attached :images
  has_one_attached :video

  validates :title, presence: true, length: { maximum: 60 }
  validates :description, length: { maximum: 2000 }, allow_blank: true
end
