# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::DriverLocation do
  let(:attributes) do
    {
      location: {
        lat: '13.740167',
        lng: '100.535237'
      },
      updatedAt: '2017-12-01T14:30.00Z'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[location updatedAt]
end
