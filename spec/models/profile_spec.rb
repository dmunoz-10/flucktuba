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

  describe 'Color theme validation' do
    it 'must exist' do
      profile = build(:profile, color_theme: nil)
      profile.valid?
      expect(profile.errors[:color_theme]).to include("can't be blank")
    end
  end

  describe 'Primary color validation' do
    it 'must exist' do
      profile = build(:profile, primary_color: nil)
      profile.valid?
      expect(profile.errors[:primary_color]).to include("can't be blank")
    end
  end
end
