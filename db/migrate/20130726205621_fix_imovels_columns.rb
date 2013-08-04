class FixImovelsColumns < ActiveRecord::Migration
  def change
    change_table :imovels do |t|
      #t.rename :cod_ref, :codigo_referencia
      t.rename :taxa_de_condominio, :taxa_condominio
      t.rename :vagas, :vagas_garagem
      t.remove :quartos, :suites
    end
  end
end
