require_relative 'journeylog'

class Oystercard

  attr_reader :bal, :entry_stn, :trips

  MAX_BAL = 90
  TOP_UP_ERROR = "Top-up failed: max balance of £#{MAX_BAL}."
  MIN_FARE_ERROR = "Insufficient funds, min fare is £#{Journey::MIN_FARE}"

  def initialize(jrnylog_klass = JourneyLog)
    @jrnylog_klass = jrnylog_klass
    @bal = 0
    @jrnylog = jrnylog_klass.new
  end

  def top_up(val)
    raise TOP_UP_ERROR if (bal + val) > MAX_BAL
    @bal += val
  end

  def touch_in(entry_stn)
    raise MIN_FARE_ERROR if bal < Journey::MIN_FARE
    deduct(@jrnylog.outstanding_charges)
    @jrnylog.start_jrny(entry_stn)
  end

  def touch_out(exit_stn)
    deduct( @jrnylog.finish_jrny(exit_stn) )    # finish_jrny returns the fare
  end

  private

  def deduct(amount)
    @bal -= amount
  end

end
