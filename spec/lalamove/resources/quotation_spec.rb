# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Resources::Quotation do
  let(:payload) { params_from_json('order') }

  describe '#perform', :vcr do
    subject { described_class.perform!(payload) }

    context 'when success' do
      it 'returns a valid response' do
        expect(Lalamove::Services::QuotationService).to receive(:perform!).once.and_call_original

        # TODO: Needs tokens in order to makes real connections
        # is_expected.to be_valid
        is_expected.not_to be_valid
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
