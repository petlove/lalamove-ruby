# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Services::OrderDetailService do
  subject { described_class.perform!(id: id) }

  describe '#perform', :vcr do
    context 'when valid' do
      let(:id) { '123' }

      it 'returns an object as expected with valid' do
        expect(Lalamove::Services::RequestService).to receive(:perform!).once.with(
          action: :get, payload: anything, path: "/v2/orders/#{id}"
        ).and_return(double(valid?: true))

        is_expected.to be_valid
      end
    end

    context 'when failure' do
      let(:id) { '456' }

      it 'returns an object as expected with failure' do
        expect(Lalamove::Services::RequestService).to receive(:perform!).once.with(
          action: :get, payload: anything, path: "/v2/orders/#{id}"
        ).and_return(double(valid?: false))

        is_expected.not_to be_valid
      end
    end
  end
end
