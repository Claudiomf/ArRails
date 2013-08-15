class FixImovelsColumnsNumeric < ActiveRecord::Migration
  def change
    execute("ALTER TABLE imovels ALTER COLUMN taxa_condominio TYPE numeric(8,2);")
    execute("ALTER TABLE imovels ALTER COLUMN iptu TYPE numeric(8,2);")
    execute("ALTER TABLE imovels ALTER COLUMN valor TYPE numeric(10,2);")
  end
end
