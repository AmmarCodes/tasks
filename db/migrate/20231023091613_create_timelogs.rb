# frozen_string_literal: true

class CreateTimelogs < ActiveRecord::Migration[6.1]
  def change
    create_table :timelogs do |t|
      t.references :task, null: false, foreign_key: true
      t.datetime :start_time, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :end_time
    end
  end
end
