class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :value
      t.string :locase_value

      # t.timestamps
    end
    add_index :words, :locase_value
  end
end
