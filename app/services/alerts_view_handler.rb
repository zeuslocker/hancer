class AlertsViewHandler
  attr_reader :result

  class << self
    def call(result)
      new(result).perform
    end
  end

  def initialize(result)
    @result = result
  end

  def perform
    setup_alerts!
  end

  def setup_alerts!
    result['contract.default'].errors.full_messages.inject('') do |acc, elem|
      acc << elem + ' '
    end.chop
  end
end
