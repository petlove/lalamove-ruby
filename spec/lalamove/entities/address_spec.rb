# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Entities::Address do
  let(:attributes) do
    {
      displayString: '444 ถนน พญาไท แขวง วังใหม่ เขต ปทุมวัน กรุงเทพมหานคร 10330 ประเทศไทย',
      country: 'TH'
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like 'entity_attributes', %i[displayString country]
end
