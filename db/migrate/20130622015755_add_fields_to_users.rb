class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string

    add_column :users, :name, :string

    add_column :users, :cpf, :string

    add_column :users, :tel, :string

    add_column :users, :cel, :string

    add_column :users, :rg, :string

    add_column :users, :ende, :string

  end
end
