class CreateCleaners < ActiveRecord::Migration[6.0]
  def change
    create_table :cleaners do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :quality_score
      t.string :phone_number

      t.timestamps
    end
  end
end
