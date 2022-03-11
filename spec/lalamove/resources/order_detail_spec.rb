# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Resources::OrderDetail do
  describe '#perform', :vcr do
    subject { described_class.perform!(id) }

    context 'when success' do
      let(:id) { '194170101280' }
      let(:delivery_report) { subject.data.dig(:data, :stops, 1, :POD) }

      it 'returns a valid response' do
        is_expected.to be_valid
      end

      it 'returns POD status with deliveredAt' do
        expect(delivery_report[:deliveredAt]).not_to be nil
        expect(delivery_report[:status]).to eq('DELIVERED')
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
