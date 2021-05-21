# frozen_string_literal: true

RSpec.describe Lalamove::Ruby do
  it 'returns a version number' do
    expect(Lalamove::Ruby::VERSION).not_to be nil
  end
end
