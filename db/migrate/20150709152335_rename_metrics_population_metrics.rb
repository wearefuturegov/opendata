class RenameMetricsPopulationMetrics < ActiveRecord::Migration
  def change
    rename_table :metrics, :population_metrics
  end
end
