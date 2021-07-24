class CreateMedals < ActiveRecord::Migration[6.1]
  def change
    create_table :medals do |t|
      t.string :type
      t.string :competition
      t.references :athlete, null: false, foreign_key: true

      t.timestamps
    end
  end
end
