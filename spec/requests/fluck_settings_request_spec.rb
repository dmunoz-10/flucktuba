# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FluckSettings', type: :request do
  let!(:user) { create(:user) }
  let!(:fluck) { create(:fluck) }
  let!(:tuba) { create(:tuba, user: user, fluck: fluck, role: :owner) }

  before do
    sign_in user
  end

  describe 'PUT #update' do
    context 'when params are ok' do
      it 'must update the rule' do
        params = { fluck_setting: attributes_for(:fluck_setting) }
        put settings_fluck_path(fluck.nickname), params: params

        expect(response).to redirect_to(show_flucks_path(fluck.nickname))
      end
    end

    context 'when params are wrong' do
      it 'must not update the rule' do
        params = { fluck_setting: attributes_for(:fluck_setting, banner_size: nil) }
        put settings_fluck_path(fluck.nickname), params: params

        expect(response).to redirect_to(show_flucks_path(fluck.nickname))
        expect(flash[:alert]).to eq('Customization could not be updated!')
      end
    end
  end
end
