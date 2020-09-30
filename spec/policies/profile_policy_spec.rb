# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilePolicy, type: :policy do
  subject(:profile_policy) { described_class }

  let(:user) { create(:user) }

  permissions :update? do
    it 'grants access' do
      expect(profile_policy).to permit(user, user.profile)
    end
  end
end
