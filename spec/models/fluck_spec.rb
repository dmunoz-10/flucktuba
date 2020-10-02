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
end
