class CreateJoinTableCleanerCity < ActiveRecord::Migration[6.0]
  def change
    create_join_table :cleaners, :cities do |t|
       t.string :name
       t.index [:cleaner_id, :city_id]
    end
  end
end
