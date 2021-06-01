# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Services::DriverLocationService do
  subject { described_class.perform!(order_id, driver_id) }

  describe '#perform' do
    context 'when valid' do
      let(:order_id) { '123' }
      let(:driver_id) { '1234' }

      it 'returns an object as expected with valid' do
        expect(Lalamove::Services::RequestService).to receive(:perform!).once.with(
          action: :get, payload: anything, path: "/v2/orders/#{order_id}/drivers/#{driver_id}/location"
        ).and_return(double(valid?: true))

        is_expected.to be_valid
      end
    end

    context 'when failure' do
      let(:order_id) { '456' }
      let(:driver_id) { '4565' }

      it 'returns an object as expected with failure' do
        expect(Lalamove::Services::RequestService).to receive(:perform!).once.with(
          action: :get, payload: anything, path: "/v2/orders/#{order_id}/drivers/#{driver_id}/location"
        ).and_return(double(valid?: false))

        is_expected.not_to be_valid
      end
    end
  end
end
