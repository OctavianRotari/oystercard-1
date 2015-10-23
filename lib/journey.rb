class Journey

  attr_reader :entry_stn, :exit_stn, :fare

  MIN_FARE, PEN_FARE = 1, 6

  def initialize
    @fare = PEN_FARE
  end

  def start_jrny(entry_stn)
    @entry_stn = entry_stn
  end

  def end_jrny(exit_stn)
    @exit_stn = exit_stn
    @fare = MIN_FARE if @entry_stn
  end

end
