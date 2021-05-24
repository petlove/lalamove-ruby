# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::Delivery do
  let(:attributes) do
    {
      toStop: 1,
      toContact: {
        name: 'Person',
        phone: '5511999999999'
      },
      remarks: 'ORDER#94\r\n1. Tshirt จำนวน 1\r\n2. Hoodie จำนวน 1\r\n'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[toStop toContact remarks]
end
