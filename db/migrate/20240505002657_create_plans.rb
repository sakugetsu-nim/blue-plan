class CreatePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.date :start_time

      t.timestamps
    end
  end
end
