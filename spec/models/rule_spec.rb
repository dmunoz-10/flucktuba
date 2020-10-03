# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rule, type: :model do
  describe 'Title validation' do
    it 'must exist' do
      rule = build(:rule, title: nil)
      rule.save
      expect(rule.errors[:title]).to include("can't be blank")
    end

    it 'must have 30 characters maximum' do
      rule = build(:rule, title: 'Test title with more than 30 characters')
      rule.save
      expect(rule.errors[:title]).to include('is too long (maximum is 30 characters)')
    end
  end

  describe 'Description validation' do
    context 'when exist' do
      it 'must have 300 characters maximum' do
        description = '
          Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
          incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
          exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
          dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
          Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
          anim id est laborum.
        '
        rule = build(:rule, description: description)
        rule.save
        expect(rule.errors[:description]).to include('is too long (maximum is 300 characters)')
      end
    end
  end
end
