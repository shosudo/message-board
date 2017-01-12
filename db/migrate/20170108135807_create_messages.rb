class CreateMessages < ActiveRecord::Migration
#This is a migration file. We can edit and create tables by migration.
#You can see the definition of the table at db/scheme.rb

  def change
    create_table :messages do |t|
    #Message(Model)のTableを作成
  
      t.string :name
      #:name => message_name
      t.string :body
      #:name => message_body

      t.timestamps null: false
      #Add created_at, updated_at to table's column
    end
  end
end
