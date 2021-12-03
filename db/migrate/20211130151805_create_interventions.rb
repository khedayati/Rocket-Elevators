class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :author_id
      t.references :customer
      t.references :building
      t.references :battery
      t.references :column
      t.references :elevator
      t.references :employee
      t.date :start_date
      t.date :end_date
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end
