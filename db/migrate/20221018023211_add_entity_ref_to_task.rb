class AddEntityRefToTask < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :entity, null: false, foreign_key: true
  end
end
