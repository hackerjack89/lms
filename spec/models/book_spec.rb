# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'database columns' do
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:author) }
    it { is_expected.to have_db_column(:price) }
    it { is_expected.to have_db_column(:status) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to define_enum_for(:status) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:library) }
  end
end
