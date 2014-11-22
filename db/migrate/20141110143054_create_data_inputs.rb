class CreateDataInputs < ActiveRecord::Migration
  def change
    create_table :data_inputs do |t|
      t.string :name
      t.attachment :tab

      t.timestamps
    end
  end
end
