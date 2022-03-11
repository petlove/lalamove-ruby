# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::Order do
  let(:attributes) do
    {
      quotationId: '1501566646089744475',
      sender: {
        stopId: '1501566647029268487',
        name: 'São Paulo',
        phone: '+551133350200'
      },
      recipients: [
        {
          stopId: '1501566647029268488',
          name: 'Anderson Ferreira',
          phone: '+5511970009090'
        }
      ],
      isRecipientSMSEnabled: false,
      isPODEnabled: true
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[
    quotationId sender recipients isRecipientSMSEnabled isPODEnabled
  ]
end
