class Journey

  attr_reader :entry_stn, :exit_stn, :fare

  MIN_FARE, PEN_FARE = 1, 6

  def start_jrny(entry_stn)
    @entry_stn = entry_stn
  end

  def end_jrny(exit_stn)
    @exit_stn = exit_stn
  end

  def fare
    return PEN_FARE if (@entry_stn.nil? || @exit_stn.nil?)
    entry_zone = @entry_stn.zone
    exit_zone = @exit_stn.zone
    fare = MIN_FARE + (exit_zone - entry_zone).abs
  end

end
