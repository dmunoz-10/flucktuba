# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe 'User validation' do
    it 'must exist' do
      participant = build(:participant)
      participant.save
      expect(participant.errors[:user]).to include('must exist')
    end

    it 'must be unique per fluck' do
      user = create(:user)
      fluck = create(:fluck)
      create(:participant, user: user, fluck: fluck)
      participant = build(:participant, user: user, fluck: fluck)
      participant.save
      expect(participant.errors[:user]).to include('is already a participant of this fluck')
    end
  end

  describe 'Fluck validation' do
    it 'must exist' do
      participant = build(:participant)
      participant.save
      expect(participant.errors[:fluck]).to include('must exist')
    end
  end

  describe 'Role validation' do
    it 'must be member by default' do
      participant = build(:participant, role: nil)
      participant.valid?
      expect(participant.role).to eq('member')
    end
  end
end
