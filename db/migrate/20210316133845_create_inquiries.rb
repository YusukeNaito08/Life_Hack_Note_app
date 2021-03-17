class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.integer :subject, default: 0, null: false
      t.text :message, null: false
      
      t.timestamps
    end
  end
end
