# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'Profile per user' do
    it 'must be unique' do
      user = create(:user)
      profile = build(:profile, user: user)
      profile.save
      expect(profile.errors[:user]).to include('already has a profile')
    end
  end
end
