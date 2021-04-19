class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :status 
      t.date :given
      t.date :return
      t.timestamps
    end
  end
end
