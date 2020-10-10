# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'Video validation' do
    it 'must exist' do
      video = build(:video)
      video.valid?
      expect(video.errors[:video]).to include("can't be blank")
    end
  end
end
