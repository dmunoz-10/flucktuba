# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TubaPolicy, type: :policy do
  subject(:tuba_policy) { described_class }

  let(:user) { User.new }

  permissions :index? do
  end

  permissions :create? do
  end

  permissions :update? do
  end

  permissions :destroy? do
  end
end
