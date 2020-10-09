# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tubas', type: :request do
  let!(:user) { create(:user) }
  let!(:fluck) { create(:fluck) }
  let!(:tuba) { create(:tuba, user: user, fluck: fluck, role: :owner) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'must render index template' do
      get fluck_tubas_path(fluck.nickname), xhr: true

      expect(response).to render_template(:index)
    end
  end
end
