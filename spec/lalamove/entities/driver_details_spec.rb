# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::DriverDetails do
  let(:attributes) do
    {
      name: 'Jackson five',
      phone: '37013701',
      plateNumber: 'LALAM0VE',
      photo: '<PROFILE_PHOTO_URL>'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[name phone plateNumber photo]
end
