# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  has_many :timelogs
  validates :title, presence: true

  def start_timer
    # if has old timer, stop it first
    Timelog.where({ task_id: id, end_time: nil }).update(end_time: DateTime.current) if active_timer?
    # create new time log
    timelogs.create
  end

  def stop_timer
    timelogs.last.update(end_time: DateTime.current)
  end

  def active_timer?
    timelogs.last&.end_time.nil?
  end
end
