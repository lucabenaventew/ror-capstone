class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :preparation_time
      t.text :cooking_time
      t.string :description
      t.boolean :public

      t.timestamps
    end
  end
end
