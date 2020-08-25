class ChangeTagInTask < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :tag, :integer, using: 'tag::integer'
  end
end
