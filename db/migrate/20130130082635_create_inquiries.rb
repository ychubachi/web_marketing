class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.text :content
      t.integer :browser_id

      t.timestamps
    end
  end
end
