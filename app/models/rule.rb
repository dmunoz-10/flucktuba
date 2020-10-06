# frozen_string_literal: true

# Fluck Model
class Rule < ApplicationRecord
  include Hashid::Rails

  belongs_to :fluck

  validates :title, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 300 }, allow_blank: true
end
