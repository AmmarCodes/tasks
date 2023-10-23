# frozen_string_literal: true

class TaskPresenter
  def initialize(task)
    @task = task
    @timer = @task.timelogs.last
  end

  def present
    task = task_props

    task.merge!(timer: TimelogPresenter.new(@timer).present) if @timer

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
      has_active_timer: active_timer?
    }
  end

  def active_timer?
    @timer && @timer.end_time.nil?
  end
end
