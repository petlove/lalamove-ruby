# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Client do
  subject { described_class }

  describe '#quotation' do
    it 'returns class call correctly' do
      expect(subject.quotation.new({})).to be_an(Lalamove::Resources::Quotation)
    end
  end

  describe '#order_creator' do
    it 'returns class call correctly' do
      expect(subject.order_creator.new({})).to be_an(Lalamove::Resources::OrderCreator)
    end
  end

  describe '#place_order' do
    it 'returns class call correctly' do
      expect(subject.place_order.new({})).to be_an(Lalamove::Resources::PlaceOrder)
    end
  end

  describe '#order_cancel' do
    it 'returns class call correctly' do
      expect(subject.order_cancel.new({})).to be_an(Lalamove::Resources::OrderCancel)
    end
  end

  describe '#order_detail' do
    it 'returns class call correctly' do
      expect(subject.order_detail.new({})).to be_an(Lalamove::Resources::OrderDetail)
    end
  end
end
