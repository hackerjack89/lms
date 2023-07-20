# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'database columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:address) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:books) }
  end
end
