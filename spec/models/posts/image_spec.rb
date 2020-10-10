# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Images validation' do
    it 'must exist' do
      image = build(:image)
      image.valid?
      expect(image.errors[:images]).to include("can't be blank")
    end
  end
end
