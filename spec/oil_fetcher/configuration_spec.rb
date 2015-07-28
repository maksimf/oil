require 'spec_helper'

RSpec.describe OilFetcher::Configuration do
  describe "#uri=" do
    let(:uri) { "www.example.com" }
    subject { OilFetcher::Configuration.new }
    before { subject.uri = uri }

    it { expect(subject.uri).to eq uri }
  end
end