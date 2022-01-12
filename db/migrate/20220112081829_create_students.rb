class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.text :name
      t.string :class_section
      t.binary :home_work
      t.integer :user_id

      t.timestamps
    end
  end
end
