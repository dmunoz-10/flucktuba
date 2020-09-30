require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  subject { described_class }

  permissions :show? do
    it 'grants access' do
      expect(subject).to permit(user, user2)
    end
  end
end
