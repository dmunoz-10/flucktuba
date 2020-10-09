# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FluckSetting, type: :model do
  describe 'Banner size validation' do
    it 'must exist' do
      fluck_setting = build(:fluck_setting, banner_size: nil)
      fluck_setting.valid?
      expect(fluck_setting.errors[:banner_size]).to include("can't be blank")
    end
  end

  describe 'Image shape validation' do
    it 'must exist' do
      fluck_setting = build(:fluck_setting, image_shape: nil)
      fluck_setting.valid?
      expect(fluck_setting.errors[:image_shape]).to include("can't be blank")
    end
  end

  describe 'Primary color validation' do
    it 'must exist' do
      fluck_setting = build(:fluck_setting, primary_color: nil)
      fluck_setting.valid?
      expect(fluck_setting.errors[:primary_color]).to include("can't be blank")
    end
  end

  describe 'Text color validation' do
    it 'must exist' do
      fluck_setting = build(:fluck_setting, text_color: nil)
      fluck_setting.valid?
      expect(fluck_setting.errors[:text_color]).to include("can't be blank")
    end
  end

  describe 'Tuba name validation' do
    it 'must exist' do
      fluck_setting = build(:fluck_setting, tuba_name: nil)
      fluck_setting.valid?
      expect(fluck_setting.errors[:tuba_name]).to include("can't be blank")
    end

    it 'must have 3 characters minimum' do
      fluck_setting = build(:fluck_setting, tuba_name: 'a')
      fluck_setting.valid?
      expect(fluck_setting.errors[:tuba_name]).to include('is too short (minimum is 3 characters)')
    end

    it 'must have 30 characters maximum' do
      fluck_setting = build(:fluck_setting, tuba_name: 'a' * 31)
      fluck_setting.valid?
      expect(fluck_setting.errors[:tuba_name]).to include('is too long (maximum is 30 characters)')
    end
  end

  describe 'Settings per fluck' do
    it 'must be unique' do
      fluck = create(:fluck)
      fluck_setting = build(:fluck_setting, fluck: fluck)
      fluck_setting.valid?
      expect(fluck_setting.errors[:fluck]).to include('already has a setting')
    end
  end
end
