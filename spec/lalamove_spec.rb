# frozen_string_literal: true

RSpec.describe Lalamove do
  describe 'version' do
    subject { Lalamove::VERSION }

    it 'returns version number presence' do
      is_expected.not_to be nil
    end

    it 'returns the real version number' do
      is_expected.to eql('0.2.0')
    end
  end

  describe '.configuration' do
    before do
      Lalamove.configure do |lalamove|
        lalamove.production = false
        lalamove.secret = '123456'
        lalamove.token = 'foo_bar_baz'
        lalamove.country = 'pt_BR'
        lalamove.currency = 'BRL'
        lalamove.market = 'BR'
      end
    end

    it 'returns correctly by the time has a block initialization' do
      expect(Lalamove.configuration.production).to be false
      expect(Lalamove.configuration.secret).to eql('123456')
      expect(Lalamove.configuration.token).to eql('foo_bar_baz')
      expect(Lalamove.configuration.country).to eql('pt_BR')
      expect(Lalamove.configuration.currency).to eql('BRL')
      expect(Lalamove.configuration.market).to eql('BR')
    end

    it 'uses a singleton object for the configuration values' do
      config1 = Lalamove.configuration
      config2 = Lalamove.configuration

      expect(config1).to eq config2
    end
  end

  describe '.configure' do
    it 'returns nil when no block given' do
      expect(Lalamove.configure).to eql(nil)
    end

    it 'raise error if no method' do
      expect do
        Lalamove.configure { |c| c.user = 'Bart' }
      end.to raise_error(NoMethodError)
    end
  end

  describe '#client' do
    it 'returns class call correctly' do
      expect(subject.client).to eql(Lalamove::Client)
    end
  end
end
