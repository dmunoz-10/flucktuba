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
end
