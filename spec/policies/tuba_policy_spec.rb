# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TubaPolicy, type: :policy do
  subject(:tuba_policy) { described_class }

  let(:user) { create(:user) }
  let(:fluck) { create(:fluck) }

  permissions :create? do
    context 'when the current user is banned or a member' do
      let(:tuba) { create(:tuba, user: user, fluck: fluck, role: %i[member banned].sample) }
      it 'denies access' do
        expect(tuba_policy).not_to permit(user, tuba)
      end
    end

    context 'when the current user is not a member' do
      it 'grants access' do
        tuba = build(:tuba, user: user, fluck: fluck)
        expect(tuba_policy).to permit(user, tuba)
      end
    end
  end

  permissions :update? do
  end

  permissions :destroy? do
    context 'when the current user is the owner or is banned' do
      let(:tuba) { create(:tuba, user: user, fluck: fluck, role: %i[owner banned].sample) }
      it 'denies access' do
        expect(tuba_policy).not_to permit(user, tuba)
      end
    end

    context 'when the current user is an admin or a member' do
      let(:tuba) { create(:tuba, user: user, fluck: fluck, role: %i[admin member].sample) }
      it 'grants access' do
        expect(tuba_policy).to permit(user, tuba)
      end
    end
  end
end
