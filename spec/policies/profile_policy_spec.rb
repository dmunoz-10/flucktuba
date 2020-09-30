require 'rails_helper'

RSpec.describe ProfilePolicy, type: :policy do
  let(:user) { create(:user) }

  subject { described_class }

  permissions :update? do
    it 'grants access' do
      expect(subject).to permit(user, user.profile)
    end
  end
end
