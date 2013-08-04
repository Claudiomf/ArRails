class AddForeignKeyUser < ActiveRecord::Migration
    def up
    execute <<-SQL
        ALTER TABLE users
           ADD CONSTRAINT fk_corretor
           FOREIGN KEY (corretor_id)
           REFERENCES corretors(id)   
      SQL
  end

  def down
   execute <<-SQL
        ALTER TABLE users
        DROP FOREIGN KEY fk_corretor
     SQL
  end
end
