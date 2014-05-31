class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :author
      t.date :publish_date
      t.reference :book
      t.reference :user

      t.timestamps
    end
  end
end
