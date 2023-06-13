# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many events' do
      association = described_class.reflect_on_association(:events)

      expect(association.macro).to eq(:has_many)
    end
  end

  describe 'devise modules' do
    it 'includes the necessary devise modules' do
      expect(described_class.devise_modules).to include(:database_authenticatable, :registerable, :recoverable,
                                                        :rememberable, :validatable)
    end
  end
end
