class RenameCustomerCommentToInquiry < ActiveRecord::Migration
  def up
    rename_column :customers, :comment, :inquiry
  end

  def down
    rename_column :customers, :inquiry, :comment
  end
end
