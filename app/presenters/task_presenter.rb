# frozen_string_literal: true

class TaskPresenter
  def initialize(task)
    @task = task
    @timer = @task.timelogs.last
  end

  def present
    task = task_props

    task.merge!(timer: TimelogPresenter.new(@timer).present) if active_timer?

    task.merge!(timelogs: timelogs)

    task
  end

  private

  def task_props
    {
      id: @task.id,
      title: @task.title,
      content: @task.content,
      completed: @task.completed,
      due_date: @task.due_date,
      has_active_timer: active_timer?,
      duration: @task.timelogs.filter(&:end_time).map { |t| t.end_time - t.start_time }.sum.round
    }
  end

  def active_timer?
    @timer && @timer.end_time.nil?
  end

  def timelogs
    @task.timelogs.map { |l| TimelogPresenter.new(l).present }
  end
end
