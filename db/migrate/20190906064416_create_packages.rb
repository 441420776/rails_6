class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :version
      t.string :code
      t.string :file

      t.timestamps
    end
    add_index :packages, :name
  end
end
