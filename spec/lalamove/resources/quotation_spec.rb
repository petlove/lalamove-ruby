# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Resources::Quotation do
  let(:payload) { params_from_json('order') }

  describe '#perform', :vcr do
    subject { described_class.perform!(stock_location: payload[:stock_location], orders: [payload]) }

    context 'when success' do
      it 'returns a valid response' do
        expect(Lalamove::Services::QuotationService).to receive(:perform!).once.and_call_original

        is_expected.to be_valid
      end
    end

    context 'when success' do
      let(:payload) { params_from_json('invalid_order') }

      it 'returns a invalid response with request errors' do
        is_expected.not_to be_valid
      end
    end
  end
end
