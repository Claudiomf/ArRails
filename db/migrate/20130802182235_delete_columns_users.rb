class DeleteColumnsUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :cpf, :tel, :cel, :name, :rg, :ende
    end
  end
end
