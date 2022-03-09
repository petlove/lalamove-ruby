# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::Quotation do
  let(:attributes) do
    {
      language: "PT_BR",
      serviceType: "LALAGO",
      stops: [
        {"address": "Av. Dr. Cardoso de Melo, 1155 - Vila Olimpia, São Paulo - SP, 04548-004, Brazil"},
        {"address": "Rua Dom salomão ferraz, 1, 1 - Vila Andrade, São Paulo - SP, 05729140, Brazil"}
      ],
      specialRequests: [],
      scheduleAt: ''
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[
    language serviceType stops scheduleAt specialRequests
  ]
end
