class AddNoOverlapConstraint < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE events ADD CONSTRAINT no_overlap EXCLUDE USING gist (user_id WITH =, duration WITH &&)
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE events DROP CONSTRAINT no_overlap
    SQL
  end
end
