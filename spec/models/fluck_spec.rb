# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fluck, type: :model do
  describe 'Name validation' do
    it 'must exist' do
      fluck = build(:fluck, name: nil)
      fluck.save
      expect(fluck.errors[:name]).to include("can't be blank")
    end
  end

  describe 'Nickname validation' do
    it 'must exist' do
      fluck = build(:fluck, nickname: nil)
      fluck.save
      expect(fluck.errors[:nickname]).to include("can't be blank")
    end

    it 'must be unique' do
      create(:fluck, nickname: 'hola_mundo')
      fluck = build(:fluck, nickname: 'hola_mundo')
      fluck.save
      expect(fluck.errors[:nickname]).to include('has already been taken')
    end
  end

  describe 'Description validation' do
    context 'when does not exist' do
      it 'must not to show errors' do
        fluck = build(:fluck, description: nil)
        fluck.valid?
        expect(fluck.errors[:description]).to eq([])
      end
    end

    context 'when exist' do
      it 'must have 700 characters maximum' do
        fluck = build(:fluck, description: 'a' * 701)
        fluck.save
        expect(fluck.errors[:description]).to include('is too long (maximum is 700 characters)')
      end
    end
  end

  describe 'Method' do
    let!(:user) { create(:user) }
    let!(:fluck) { create(:fluck) }

    describe 'tuba' do
      context 'when the user is a tuba' do
        it 'must return the tuba' do
          tuba_expected = create(:tuba, user: user, fluck: fluck)

          tuba = fluck.tuba(user)
          expect(tuba).to eq(tuba_expected)
        end
      end

      context 'when the user is not a tuba' do
        it 'must return nil' do
          expect(fluck.tuba(user)).to eq(nil)
        end
      end
    end

    describe 'owner?' do
      context 'when the user is the owner' do
        it 'must return true' do
          create(:tuba, user: user, fluck: fluck, role: :owner)

          expect(fluck.owner?(user)).to eq(true)
        end
      end

      context 'when the user is not the owner' do
        it 'must return false' do
          create(:tuba, user: user, fluck: fluck)

          expect(fluck.owner?(user)).to eq(false)
        end
      end
    end

    describe 'admin?' do
      context 'when the user is an admin' do
        it 'must return true' do
          create(:tuba, user: user, fluck: fluck, role: :admin)

          expect(fluck.admin?(user)).to eq(true)
        end
      end

      context 'when the user is not an admin' do
        it 'must return false' do
          create(:tuba, user: user, fluck: fluck)

          expect(fluck.admin?(user)).to eq(false)
        end
      end
    end

    describe 'banned?' do
      context 'when the user is banned' do
        it 'must return true' do
          create(:tuba, user: user, fluck: fluck, role: :banned)

          expect(fluck.banned?(user)).to eq(true)
        end
      end

      context 'when the user is not banned' do
        it 'must return false' do
          create(:tuba, user: user, fluck: fluck)

          expect(fluck.banned?(user)).to eq(false)
        end
      end
    end
  end

  describe 'Settings validation' do
    it 'must be created' do
      fluck = create(:fluck)
      expect(fluck.settings).not_to eq(nil)
    end
  end
end
