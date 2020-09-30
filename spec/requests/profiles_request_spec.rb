# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'PUT #update' do
    context 'when params are ok' do
      it 'must render edit user and have a notice flash' do
        params = { profile: attributes_for(:profile) }
        put profile_path, params: params

        expect(response).to redirect_to(edit_user_registration_url)
        expect(flash[:notice]).to eq('Settings has changed!')
      end
    end

    context 'when params are wrong' do
      it 'must render edit user and have an alert flash' do
        params = { profile: attributes_for(:profile, color_theme: nil) }
        put profile_path, params: params

        expect(response).to redirect_to(edit_user_registration_url)
        expect(flash[:alert]).to eq('There was an error')
      end
    end
  end
end
