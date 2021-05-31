# frozen_string_literal: true

RSpec.describe Lalamove do
  describe 'version' do
    subject { Lalamove::VERSION }

    it 'returns version number presence' do
      is_expected.not_to be nil
    end

    it 'returns the real version number' do
      is_expected.to eql('0.1.1')
    end
  end
end
