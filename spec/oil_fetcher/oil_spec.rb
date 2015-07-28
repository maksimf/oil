require 'spec_helper'

RSpec.describe OilFetcher::Oil do
  describe '.new' do
    subject { OilFetcher::Oil.new(params) }

    context 'when params are ok' do
      let(:date) { Date.today }
      let(:params) { { rate: 50.0, date: date.to_s } }

      it { expect(subject.rate).to eq params[:rate] }
      it { expect(subject.date).to eq date }
    end

    context 'when params are invalid' do
      let(:params) { nil }

      it { expect { subject }.to raise_error ArgumentError }
    end
  end
end
