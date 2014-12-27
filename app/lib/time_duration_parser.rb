module TimeDurationParser

  # takes in a string and return total milliseconds as float
  # e.g. parse(1:51.51) #=> 111.51
  def parse(string_time_duration)
    return nil unless string_time_duration.present?

    match_data = /(\d*:)?(\d{2})\.(\d{2})/.match(string_time_duration)
    minutes      = match_data[1].try(:to_i)
    seconds      = match_data[2].try(:to_i)
    milliseconds = match_data[3].try(:to_i)

    if minutes
      (minutes * 6000) + (seconds * 100) + milliseconds
    else
      (seconds * 100) + milliseconds
    end
  end

  def output(total_milliseconds)
    return nil unless total_milliseconds.present?

    minutes      = total_milliseconds / 6000
    seconds      = total_milliseconds % 6000 / 100
    milliseconds = total_milliseconds % 100
    format("%02d:%02d.%02d", minutes, seconds, milliseconds)
      .gsub(/^0+/, '').gsub(/^:/, '')
  end
end