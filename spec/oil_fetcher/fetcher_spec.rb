require 'spec_helper'

RSpec.describe OilFetcher::Fetcher do
  describe '.call' do
    subject { OilFetcher.call }
    before { stub_request(:get, /.*/).to_return(response) }

    context 'when response is ok' do
      context 'and json structure is ok' do
        let(:response) { { body: load_fixture('ok_response.json') } }

        it { is_expected.to be_truthy }
      end

      context 'and body is nil' do
        let(:response) { { body: nil } }

        it { is_expected.to be nil }
      end
    end
  end
end
