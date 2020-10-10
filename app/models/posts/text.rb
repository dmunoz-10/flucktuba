# frozen_string_literal: true

# Text Post Model
class Text < Post
  validates :description, presence: true
end
