# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::QuotationLocation do
  let(:attributes) do
    {
      lat: '13.740167',
      lng: '100.535237'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[lat lng]
end
