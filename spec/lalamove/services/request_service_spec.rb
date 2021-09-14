# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lalamove::Services::RequestService do
  let(:url)      { 'https://rest.sandbox.lalamove.com' }
  let(:token)    { '' }
  let(:payload)  { { foo: 'bar' } }
  let(:request)  { double(:request) }
  let(:path)     { '' }
  let(:response) { double(body: '{}', status: 201, success?: true, errors: {}) }

  let(:headers) do
    {
      'Content-Type': 'application/json',
      Accept: 'application/json',
      Authorization: anything,
      'X-LLM-Country': 'BR_SAO',
      'X-Request-ID': anything
    }
  end

  subject { described_class.perform(action: 'post', path: path, payload: payload) }

  describe '#perform' do
    context 'when success' do
      let(:path) { '/api/foobar' }

      it 'returns correctly request body' do
        expect(Faraday).to receive(:new).once.with(
          url: url,
          headers: headers,
          request: { open_timeout: 5, timeout: 10 }
        ).and_return(request)

        expect(request).to receive(:send).once.with('post', path, payload.to_json).and_return(response)

        is_expected.to be_valid
      end
    end

    context 'when failure' do
      it 'returns an error' do
        expect(Faraday).to receive(:new).once.with(
          url: url,
          headers: headers,
          request: { open_timeout: 5, timeout: 10 }
        ).and_raise(StandardError)

        expect(request).not_to receive(:post)
        is_expected.not_to be_valid
      end
    end

    context 'when status code different from 201' do
      let(:body)    { '{"foo": "bar"}' }
      let(:request) { double(post: result) }

      let(:result) do
        double(
          body: body,
          status: 422,
          success?: false,
          reason_phrase: { foo: 'bar' },
          response_body: { bar: 'Baz' }.to_json
        )
      end

      before do
        allow_any_instance_of(described_class).to receive(:connection).and_return(request)
      end

      it 'returns an error' do
        expect(subject.errors).to eq([JSON.parse(result.body, symbolize_names: true)])
      end
    end
  end
end
