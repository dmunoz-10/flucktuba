# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rules', type: :request do
  let!(:user) { create(:user) }
  let!(:fluck) { create(:fluck) }
  let!(:tuba) { create(:tuba, user: user, fluck: fluck, role: :owner) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'when params are ok' do
      it 'must create the rule' do
        params = { rule: attributes_for(:rule) }
        post fluck_rules_path(fluck.nickname), params: params, xhr: true

        expect(response).to render_template(:index)
      end
    end

    context 'when params are wrong' do
      it 'must not create the rule' do
        params = { rule: attributes_for(:rule, title: nil) }
        post fluck_rules_path(fluck.nickname), params: params, xhr: true

        expect(response).to render_template(:error)
      end
    end
  end

  describe 'GET #edit' do
    it 'must render edit template' do
      rule = create(:rule, fluck: fluck)
      get edit_fluck_rule_path(fluck.nickname, rule.to_param), xhr: true

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    context 'when params are ok' do
      it 'must update the rule' do
        rule = create(:rule, fluck: fluck)
        params = { rule: attributes_for(:rule) }
        put fluck_rule_path(fluck.nickname, rule.to_param), params: params, xhr: true

        expect(response).to render_template(:index)
      end
    end

    context 'when params are wrong' do
      it 'must not update the rule' do
        rule = create(:rule, fluck: fluck)
        params = { rule: attributes_for(:rule, title: nil) }
        put fluck_rule_path(fluck.nickname, rule.to_param), params: params, xhr: true

        expect(response).to render_template(:error)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when everything are ok' do
      it 'must delete the rule' do
        rule = create(:rule, fluck: fluck)
        delete fluck_rule_path(fluck.nickname, rule.to_param), xhr: true

        expect(response).to render_template(:index)
      end
    end

    context 'when something are wrong' do
      it 'must not delete the rule' do
        rule = create(:rule, fluck: fluck)
        allow(Rule).to receive(:find_by_hashid!).with(rule.to_param).and_return(rule)
        allow(rule).to receive(:destroy).and_return(false)

        delete fluck_rule_path(fluck.nickname, rule.to_param), xhr: true

        expect(response).to render_template(:error)
      end
    end
  end
end
