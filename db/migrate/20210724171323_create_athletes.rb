class CreateAthletes < ActiveRecord::Migration[6.1]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :gender
      t.string :country

      t.timestamps
    end
  end
end
