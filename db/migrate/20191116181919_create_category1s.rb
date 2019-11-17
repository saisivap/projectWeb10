class CreateCategory1s < ActiveRecord::Migration[5.2]
  def change
    create_table :category1s do |t|
      t.string :name

      t.timestamps
    end
  end
end
