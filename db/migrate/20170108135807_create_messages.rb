class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    #create a messages table, what is :???
      t.string :name
      #:name =>属性名?
      t.string :body

      t.timestamps null: false
    end
  end
end
