# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Type validation' do
    it 'must exist' do
      post = build(:post, type: nil)
      post.valid?
      expect(post.errors[:type]).to include("can't be blank")
    end
  end

  describe 'Title validation' do
    it 'must exist' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end
  end

  describe 'Description validation' do
    context 'when does not exist' do
      it 'must not to show errors' do
        post = build(:post, description: nil)
        post.valid?
        expect(post.errors[:description]).to eq([])
      end
    end

    context 'when exist' do
      it 'must have 2000 characters maximum' do
        post = build(:post, description: 'a' * 2001)
        post.valid?
        expect(post.errors[:description]).to include('is too long (maximum is 2000 characters)')
      end
    end
  end
end
