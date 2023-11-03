# frozen_string_literal: true

module Api
  class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: %i[show update destroy complete uncomplete start_timer stop_timer]

    # GET /tasks or /tasks.json
    def index
      @tasks = current_user.tasks.includes(:timelogs).all
      render json: @tasks.map { |task| TaskPresenter.new(task).present }
    end

    # GET /tasks/1 or /tasks/1.json
    def show
      render json: TaskPresenter.new(@task).present
    end

    # POST /tasks or /tasks.json
    def create
      @task = current_user.tasks.new(task_params)

      if @task.save
        render :show, status: :created, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tasks/1 or /tasks/1.json
    def update
      if @task.update(task_params)
        render :show, status: :ok, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks/1 or /tasks/1.json
    def destroy
      @task.destroy

      head :no_content
    end

    def complete
      @task.update({ completed: true })
    end

    def uncomplete
      @task.update({ completed: false })
    end

    def start_timer
      @task.start_timer
    end

    def stop_timer
      @task.stop_timer
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.includes(:timelogs).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :content, :completed, :due_date)
    end
  end
end
