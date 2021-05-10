class RemoveCommenterFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :commenter, :text
  end
end
