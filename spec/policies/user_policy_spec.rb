# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject(:user_policy) { described_class }

  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  permissions :show? do
    it 'grants access' do
      expect(user_policy).to permit(user, user2)
    end
  end
end
