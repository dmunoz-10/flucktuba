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
        rule = build(:rule, description: 'a' * 301)
        rule.save
        expect(rule.errors[:description]).to include('is too long (maximum is 300 characters)')
      end
    end

    context 'when does not exist' do
      it 'must not to show errors' do
        rule = build(:rule, description: nil)
        rule.valid?
        expect(rule.errors[:description]).to eq([])
      end
    end
  end
end
