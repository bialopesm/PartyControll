class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :place
      t.text :description
      t.string :status
      t.text :supplier

      t.timestamps
    end
  end
end
