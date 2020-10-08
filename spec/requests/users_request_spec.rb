# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'must render show template' do
      get user_path(user2.username)

      expect(response).to render_template(:show)
    end
  end
end
