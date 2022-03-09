# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::QuotationStop do
  let(:attributes) do
    {
      location: {
        lat: '13.740167',
        lng: '100.535237'
      },
      address: 'Rua Dom Salomão Ferraz, 123'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[location address]
end
