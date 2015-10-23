require 'journey'

describe Journey do

  context '#start_jrny' do
    it 'stores the entry station' do
      subject.start_jrny(:stn)
      expect(subject.entry_stn).to eq (:stn)
    end
  end

  context '#end_jrny' do
    it 'stores the exit station' do
      subject.end_jrny(:stn)
      expect(subject.exit_stn).to eq (:stn)
    end
  end

  context '#fare' do
    it 'returns min fare for a valid journey' do
      subject.start_jrny(:stn)
      subject.end_jrny(:stn)
      expect(subject.fare).to eq(Journey::MIN_FARE)
    end
    it 'returns penalty fare if no entry_stn' do
      subject.end_jrny(:stn)
      expect(subject.fare).to eq(Journey::PEN_FARE)
    end
  end
  
end
