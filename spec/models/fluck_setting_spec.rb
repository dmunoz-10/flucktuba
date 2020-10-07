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

  describe 'Settings per fluck' do
    it 'must be unique' do
      fluck = create(:fluck)
      fluck_setting = build(:fluck_setting, fluck: fluck)
      fluck_setting.valid?
      expect(fluck_setting.errors[:fluck]).to include('already has a setting')
    end
  end
end
