class Oystercard

  attr_reader :bal, :entry_stn, :trips

  MAX_BAL = 90
  TOP_UP_ERROR = "Top-up failed: max balance of £#{MAX_BAL}."
  MIN_FARE_ERROR = "Insufficient funds, min fare is £#{Journey::MIN_FARE}"

  def initialize(jrny_klass = Journey)
    @jrny_klass = jrny_klass
    @bal = 0
    @trips = Array.new
  end

  def top_up(val)
    raise TOP_UP_ERROR if (bal + val) > MAX_BAL
    @bal += val
  end

  def touch_in(entry_stn)
    raise MIN_FARE_ERROR if bal < Journey::MIN_FARE
    deduct unless @current_jrny.nil?
    current_jrny.start_jrny(entry_stn)
  end

  def touch_out(exit_stn)
    current_jrny.end_jrny(exit_stn)
    @trips << @current_jrny
    deduct
    @current_jrny = nil
  end

  private

  def deduct
    @bal -= @current_jrny.fare
  end

  def current_jrny
    @current_jrny ? @current_jrny : (@current_jrny =  @jrny_klass.new)
  end

end
