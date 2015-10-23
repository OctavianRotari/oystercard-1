require 'journey'

describe Journey do

  let(:zone1_stn) { double(:zone1_stn, zone: 1) }
  let(:zone2_stn) { double(:zone2_stn, zone: 2) }
  let(:zone3_stn) { double(:zone3_stn, zone: 3) }
  let(:zone4_stn) { double(:zone4_stn, zone: 4) }
  let(:zone5_stn) { double(:zone5_stn, zone: 5) }

  let(:one_zone_fare) { 1 }
  let(:two_zone_fare) { 2 }
  let(:three_zone_fare) { 3 }
  let(:four_zone_fare) { 4 }
  let(:five_zone_fare) { 5 }

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
    it 'returns correct fare for a journey in a single zone' do
      subject.start_jrny(zone1_stn)
      subject.end_jrny(zone1_stn)
      expect(subject.fare).to eq one_zone_fare
    end

    it 'returns correct fare for a journey across two zones' do
      subject.start_jrny(zone1_stn)
      subject.end_jrny(zone2_stn)
      expect(subject.fare).to eq two_zone_fare
    end

    it 'returns correct fare for a journey across four zones' do
      subject.start_jrny(zone1_stn)
      subject.end_jrny(zone5_stn)
      expect(subject.fare).to eq five_zone_fare
    end

  end

end
