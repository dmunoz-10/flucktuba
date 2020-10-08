# frozen_string_literal: true

require 'byebug'
require 'rails_helper'

RSpec.describe 'Flucks', type: :request do
  let!(:user) { create(:user) }
  let!(:fluck) { create(:fluck) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'must render new template' do
      get new_fluck_path

      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let!(:tuba) { create(:tuba, fluck: fluck, user: user, role: :owner) }

    context 'when params are ok' do
      it 'must create the fluck' do
        params = { fluck: attributes_for(:fluck) }
        post flucks_path, params: params

        expect(response).to render_template(:show)
        expect(flash[:notice]).to eq('Fluck created!')
      end
    end

    context 'when params are wrong' do
      it 'must not create the fluck' do
        params = { fluck: attributes_for(:fluck, name: nil) }
        post flucks_path, params: params

        expect(response).to render_template(:new)
        expect(flash[:alert]).to eq('It could not be created!')
      end
    end
  end

  describe 'GET #show' do
    it 'must render show template' do
      get show_flucks_path(fluck.nickname)

      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    let!(:tuba) { create(:tuba, fluck: fluck, user: user, role: :owner) }

    it 'must render edit template' do
      get edit_fluck_path(fluck.nickname)

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    let!(:tuba) { create(:tuba, fluck: fluck, user: user, role: :owner) }

    context 'when params are ok' do
      it 'must update the fluck' do
        params = { fluck: attributes_for(:fluck) }
        put fluck_path(fluck.nickname), params: params

        expect(response).to render_template('flucks/show')
        expect(flash[:notice]).to eq('Fluck updated!')
      end
    end

    context 'when params are wrong' do
      it 'must not update the fluck' do
        params = { fluck: attributes_for(:fluck, name: nil) }
        put fluck_path(fluck.nickname), params: params

        expect(response).to render_template('flucks/edit')
        expect(flash[:alert]).to eq('It could not be updated!')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:tuba) { create(:tuba, fluck: fluck, user: user, role: :owner) }

    context 'when everything is ok' do
      it 'must delete the fluck' do
        delete fluck_path(fluck.nickname)

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Fluck deleted!')
      end
    end

    # context 'when something is wrong' do
    #   it 'must not delete the fluck' do
    #     fluck_obj = double(fluck)
    #     allow(Fluck).to receive(:find_by!).with(fluck.nickname).and_return(fluck_obj)
    #     allow(fluck_obj).to receive(:destroy).and_return(false)
    #
    #     delete fluck_path(fluck_obj.nickname)
    #
    #     expect(response).to redirect_to(root_path)
    #     expect(flash[:alert]).to eq('It could not be deleted!')
    #   end
    # end
  end
end
