# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FluckPolicy, type: :policy do
  subject(:fluck_policy) { described_class }

  let(:user) { create(:user) }
  let(:fluck) { create(:fluck) }

  permissions :new? do
    it 'grants access' do
      expect(fluck_policy).to permit(user, fluck)
    end
  end

  permissions :create? do
    it 'grants access' do
      expect(fluck_policy).to permit(user, fluck)
    end
  end

  permissions :show? do
    context 'when user is banned' do
      it 'denies acces' do
        create(:tuba, user: user, fluck: fluck, role: :banned)
        expect(fluck_policy).not_to permit(user, fluck)
      end
    end

    context 'when user is not banned' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck)
        expect(fluck_policy).to permit(user, fluck)
      end
    end
  end

  permissions :edit? do
    context 'when user is the owner' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :owner)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is an admin' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :admin)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is not the owner or an admin' do
      it 'denies access' do
        create(:tuba, user: user, fluck: fluck)
        expect(fluck_policy).not_to permit(user, fluck)
      end
    end
  end

  permissions :update? do
    context 'when user is the owner' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :owner)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is an admin' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :admin)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is not the owner or an admin' do
      it 'denies access' do
        create(:tuba, user: user, fluck: fluck)
        expect(fluck_policy).not_to permit(user, fluck)
      end
    end
  end

  permissions :destroy? do
    context 'when user is the owner' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :owner)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is not the owner' do
      it 'denies access' do
        roles = %i[admin member banned]
        create(:tuba, user: user, fluck: fluck, role: roles.sample)
        expect(fluck_policy).not_to permit(user, fluck)
      end
    end
  end

  permissions :edit_rules? do
    context 'when user is the owner' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :owner)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is an admin' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :admin)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is not the owner or an admin' do
      it 'denies access' do
        create(:tuba, user: user, fluck: fluck)
        expect(fluck_policy).not_to permit(user, fluck)
      end
    end
  end

  permissions :customize? do
    context 'when user is the owner' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :owner)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is an admin' do
      it 'grants access' do
        create(:tuba, user: user, fluck: fluck, role: :admin)
        expect(fluck_policy).to permit(user, fluck)
      end
    end

    context 'when user is not the owner or an admin' do
      it 'denies access' do
        create(:tuba, user: user, fluck: fluck)
        expect(fluck_policy).not_to permit(user, fluck)
      end
    end
  end
end
