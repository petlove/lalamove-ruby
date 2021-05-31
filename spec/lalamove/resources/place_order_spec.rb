# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Resources::PlaceOrder do
  let(:payload)  { params_from_json('order') }
  let(:orders)   { [payload] }
  let(:total)    { '16.29' }
  let(:response) { double(valid?: true, data: { totalFee: total, totalFeeCurrency: 'BRL' }) }

  describe '#perform', :vcr do
    subject { described_class.perform!(stock_location: payload[:stock_location], orders: orders) }

    context 'when success' do
      it 'returns a valid response' do
        expect(Lalamove::Services::QuotationService).to receive(:perform!).once.and_return(response)
        expect(Lalamove::Services::OrderCreatorService).to receive(:perform!).once.and_call_original

        is_expected.to be_valid
      end

      context 'when payload has more than one order' do
        let(:total) { '17.39' }
        let(:orders) { [payload, payload] }

        it 'returns a valid response' do
          # expect(Lalamove::Services::QuotationService).to receive(:perform!).once.and_call_original
          expect(Lalamove::Services::QuotationService).to receive(:perform!).once.and_return(response)
          expect(Lalamove::Services::OrderCreatorService).to receive(:perform!).once.and_call_original

          is_expected.to be_valid
        end
      end
    end

    context 'when failure' do
      let(:payload) { params_from_json('invalid_order') }

      it 'returns a invalid response with request errors' do
        expect(Lalamove::Services::OrderCreatorService).not_to receive(:perform!)

        is_expected.not_to be_valid
      end
    end
  end
end
