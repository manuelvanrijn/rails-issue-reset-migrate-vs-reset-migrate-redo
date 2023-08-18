class ChangeIndex < ActiveRecord::Migration[7.0]
  def up
    remove_index :blogs, name: 'index_blogs_on_name'
    add_index :blogs, :name,
      where: "state NOT IN ('finished', 'expired') and created_at > '2018-09-01'",
      unique: true
  end

  def down
    remove_index :blogs, name: 'index_blogs_on_name'
    add_index :blogs, :name,
      where: "state != 'finished' and created_at > '2018-09-01'",
      unique: true
  end
end
