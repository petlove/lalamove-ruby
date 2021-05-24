# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::Customer do
  let(:attributes) do
    {
      name: 'Person',
      phone: '5511999999999'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[name phone]
end
