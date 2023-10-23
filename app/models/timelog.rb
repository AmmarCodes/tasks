# frozen_string_literal: true

class Timelog < ApplicationRecord
  belongs_to :task

  def duration
    return false if end_time.nil?

    ((end_time - start_time) / 60).to_i
  end
end
