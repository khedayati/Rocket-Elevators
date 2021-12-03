class ChangeInterventions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :interventions, :employees, column: :author_id
    change_column :interventions, :customer_id, :bigint, null: false
    change_column :interventions, :building_id, :bigint, null: false
    change_column :interventions, :elevator_id, :bigint, null: false
    change_column_default :interventions, :status, "Pending"
    change_column_default :interventions, :result, "Incomplete"
  end
end
