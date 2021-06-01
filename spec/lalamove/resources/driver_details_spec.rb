# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Resources::DriverDetails do
  describe '#perform', :vcr do
    subject { described_class.perform!(order_id, driver_id) }

    context 'when success' do
      let(:order_id) { '1004514830733807616' }
      let(:driver_id) { '67079' }

      it 'returns a valid response' do
        is_expected.to be_valid
      end
    end

    context 'when failure' do
      let(:order_id) { '1234' }
      let(:driver_id) { '12345' }

      it 'returns a invalid response with request errors' do
        is_expected.not_to be_valid
      end
    end
  end
end
