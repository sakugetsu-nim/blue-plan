class CreateBluePlans < ActiveRecord::Migration[7.1]
  def change
    create_table :blue_plans do |t|
      t.string :title
      t.text :body
      t.datetime :start_time

      t.timestamps
    end
  end
end
