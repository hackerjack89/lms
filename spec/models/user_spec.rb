# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'db columns' do
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:encrypted_password) }
  end
end
