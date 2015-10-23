require 'journeylog'

describe JourneyLog do

  let(:jrny){ double('jrny', start_jrny: nil, end_jrny: nil, fare: nil) }
  let(:jrny_klass){ double('jrny_klass', new: jrny) }

  subject { JourneyLog.new(jrny_klass) }

  context '#initialize' do
    it 'sets @trips to an empty array' do
      expect(subject.trips).to be_empty
    end
  end

  context '#outstanding_charges' do
    it 'stores an incomplete journey' do
      subject.start_jrny(:stn)
      subject.outstanding_charges
      expect(subject.trips.last).to eq jrny
    end
  end



end
