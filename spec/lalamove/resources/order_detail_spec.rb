# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Resources::OrderDetail do
  describe '#perform', :vcr do
    subject { described_class.perform!(id) }

    context 'when success' do
      let(:id) { '1004199200419745792' }

      it 'returns a valid response' do
        is_expected.to be_valid
      end
    end

    context 'when failure' do
      let(:id) { '123456789' }

      it 'returns a invalid response with request errors' do
        is_expected.not_to be_valid
      end
    end
  end
end
