require_relative 'journey'

class JourneyLog

  attr_reader :trips

  def initialize(jrny_klass = Journey)
    @jrny_klass = jrny_klass
    @trips = []
  end

  def start_jrny(entry_stn)
    current_jrny.start_jrny(entry_stn)
  end

  def finish_jrny(exit_stn)
    current_jrny.end_jrny(exit_stn)
    outstanding_charges   # returns the fare
  end

  def outstanding_charges
    return 0 if @current_jrny.nil?
    charge = current_jrny.fare
    store_jrny
    return charge
  end

  private

  def store_jrny
    @trips << current_jrny
    @current_jrny = nil
  end

  def current_jrny
    @current_jrny ? @current_jrny : (@current_jrny =  @jrny_klass.new)
  end

end
