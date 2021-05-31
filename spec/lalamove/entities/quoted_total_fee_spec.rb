# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::QuotedTotalFee do
  let(:attributes) do
    {
      amount: '108000',
      currency: 'BRL'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[amount currency]
end