# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Resources::Order do
  let(:payload) { params_from_json('order') }

  describe '#perform', :vcr do
    subject { described_class.perform!(payload) }

    context 'with a valid quotation to create an order' do
      it 'returns a valid response' do

        is_expected.to be_valid
      end
    end

    context 'with an invalid quotation to create order' do
      let(:payload) { params_from_json('invalid_order') }

      it 'returns a invalid response with request errors' do
        is_expected.not_to be_valid
      end
    end
  end
end
