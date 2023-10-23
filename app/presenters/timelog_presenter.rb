# frozen_string_literal: true

class TimelogPresenter
  attr_reader :timelog

  def initialize(timelog)
    @timelog = timelog
  end

  def present
    timelog = {
      id: @timelog.id,
      start_time: @timelog.start_time,
      end_time: @timelog.end_time
    }

    timelog.merge!(duration: @timelog.duration) if @timelog.duration

    timelog
  end
end
