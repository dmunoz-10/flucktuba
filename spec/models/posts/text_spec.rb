# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Text, type: :model do
  describe 'Description validation' do
    it 'must exist' do
      text = build(:text, description: nil)
      text.valid?
      expect(text.errors[:description]).to include("can't be blank")
    end
  end
end
