# Generates random timezone information.
class Forgery::Time < Forgery

  # Gets a random timezone out of the 'timezones' dictionary
  #
  #   Forgery(:timezone).timezone
  #   # => "Sydney"
  def self.zone
    dictionaries[:zones].random.unextend
  end

  def self.time
    ::Time.parse("#{rand(0..23)}:#{rand(0..59)}:#{rand(0..59)}")
  end

  def self.datetime(options={})
    options = {:future => false, :past => false, :min_delta => 0, :max_delta => 7300}.merge(options)

    ::Time.parse("#{Forgery::Date.date(options).strftime("%Y-%m-%d")} #{Forgery::Time.time}")
  end

end
