# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tuba, type: :model do
  describe 'User validation' do
    it 'must exist' do
      tuba = build(:tuba)
      tuba.save
      expect(tuba.errors[:user]).to include('must exist')
    end

    it 'must be unique per fluck' do
      user = create(:user)
      fluck = create(:fluck)
      create(:tuba, user: user, fluck: fluck)
      tuba = build(:tuba, user: user, fluck: fluck)
      tuba.save
      expect(tuba.errors[:user]).to include('is already a tuba of this fluck')
    end
  end

  describe 'Fluck validation' do
    it 'must exist' do
      tuba = build(:tuba)
      tuba.save
      expect(tuba.errors[:fluck]).to include('must exist')
    end
  end

  describe 'Role validation' do
    it 'must be member by default' do
      tuba = build(:tuba, role: nil)
      tuba.valid?
      expect(tuba.role).to eq('member')
    end
  end
end
