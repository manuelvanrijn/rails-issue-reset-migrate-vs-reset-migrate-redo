class MakeIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :blogs, :name,
      where: "state != 'finished' and created_at > '2018-09-01'",
      unique: true
  end
end
