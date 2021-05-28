# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::Order do
  it 'is inherited' do
    expect(described_class).to be < Lalamove::Entities::Quotation
  end

  let(:attributes) do
    {
      scheduleAt: '2020-09-01T14:30:00.00Z',
      serviceType: 'MOTORCYCLE',
      stops: [
        {
          location: {
            lat: '13.740167',
            lng: '100.535237'
          },
          addresses: {
            pt_BR: {
              displayString: 'Rua Dom Salomão Ferraz, 123',
              country: 'TH'
            }
          }
        }
      ],
      deliveries: [
        {
          toStop: 1,
          toContact: {
            name: 'Person',
            phone: '5511999999999'
          },
          remarks: 'ORDER#94\r\n1. Tshirt จำนวน 1\r\n2. Hoodie จำนวน 1\r\n'
        }
      ],
      requesterContact: {
        name: 'Person',
        phone: '5511999999999'
      },
      specialRequests: ['COD'],
      fleetOption: 'FLEET_FIRST',
      sms: false,
      pod: false,
      quotedTotalFee: {
        amount: '108000',
        currency: 'THB'
      }
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[
    scheduleAt serviceType stops deliveries requesterContact specialRequests quotedTotalFee sms pod fleetOption
  ]
end
