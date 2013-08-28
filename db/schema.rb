# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130827001024) do

  create_table "caracteristica_imovels", :force => true do |t|
    t.string   "descricao",  :limit => 300
    t.integer  "contador"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "corretors", :force => true do |t|
    t.string   "nome",       :limit => 300
    t.string   "cpf",        :limit => 30
    t.string   "rg",         :limit => 30
    t.string   "creci",      :limit => 10
    t.string   "telefone1",  :limit => 20
    t.string   "telefone2",  :limit => 20
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "pessoas", :force => true do |t|
    t.integer  "tipo"
    t.string   "nome",               :limit => 300
    t.string   "cpf",                :limit => 30
    t.string   "cnpj",               :limit => 30
    t.string   "rg",                 :limit => 30
    t.string   "creci",              :limit => 10
    t.string   "inscricao_estadual", :limit => 80
    t.string   "email",              :limit => 200
    t.string   "sexo",               :limit => 1
    t.string   "telefone1",          :limit => 20
    t.string   "telefone2",          :limit => 20
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.index ["id", "tipo"], :name => "index_pessoas_on_id_and_tipo", :order => {"id" => :asc, "tipo" => :asc}
  end

  create_table "enderecos", :force => true do |t|
    t.string   "logradouro",  :limit => 400
    t.string   "bairro",      :limit => 100
    t.string   "cidade",      :limit => 120
    t.string   "estado",      :limit => 120
    t.integer  "corretor_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.index ["corretor_id"], :name => "fk__enderecos_corretor_id", :order => {"corretor_id" => :asc}
    t.foreign_key ["corretor_id"], "pessoas", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_enderecos_corretor_id"
  end

  create_table "tipo_imovels", :force => true do |t|
    t.string   "nome",                 :limit => 60
    t.integer  "contador_tipo_imovel",               :default => 0, :null => false
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
  end

  create_table "transacao_imovels", :force => true do |t|
    t.string   "descricao",  :limit => 100
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "imovels", :force => true do |t|
    t.string   "codigo_referencia",   :limit => 10
    t.string   "nome",                :limit => 200
    t.string   "localizacao",         :limit => 200
    t.text     "descricao"
    t.decimal  "taxa_condominio",                    :precision => 8,  :scale => 2
    t.decimal  "iptu",                               :precision => 8,  :scale => 2
    t.decimal  "valor",                              :precision => 10, :scale => 2
    t.float    "area"
    t.integer  "quantidade_quartos"
    t.integer  "quantidade_suites"
    t.integer  "vagas_garagem"
    t.integer  "transacao_imovel_id"
    t.integer  "tipo_imovel_id"
    t.integer  "vendedor_id"
    t.integer  "cadastrador_id"
    t.boolean  "vendido"
    t.boolean  "ativo"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.index ["cadastrador_id"], :name => "fk__imovels_cadastrador_id", :order => {"cadastrador_id" => :asc}
    t.index ["tipo_imovel_id"], :name => "fk__imovels_tipo_imovel_id", :order => {"tipo_imovel_id" => :asc}
    t.index ["transacao_imovel_id"], :name => "fk__imovels_transacao_imovel_id", :order => {"transacao_imovel_id" => :asc}
    t.index ["vendedor_id"], :name => "fk__imovels_vendedor_id", :order => {"vendedor_id" => :asc}
    t.foreign_key ["cadastrador_id"], "pessoas", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_imovels_cadastrador_id"
    t.foreign_key ["tipo_imovel_id"], "tipo_imovels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_imovels_tipo_imovel_id"
    t.foreign_key ["transacao_imovel_id"], "transacao_imovels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_imovels_transacao_imovel_id"
    t.foreign_key ["vendedor_id"], "pessoas", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_imovels_vendedor_id"
  end

  create_table "images", :force => true do |t|
    t.string   "image"
    t.integer  "imovel_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.index ["imovel_id"], :name => "fk__images_imovel_id", :order => {"imovel_id" => :asc}
    t.foreign_key ["imovel_id"], "imovels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_images_imovel_id"
  end

  create_table "item_imovels", :force => true do |t|
    t.boolean  "visibilidade"
    t.string   "quantidade",               :limit => 60
    t.integer  "imovel_id"
    t.integer  "caracteristica_imovel_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.index ["caracteristica_imovel_id"], :name => "fk__item_imovels_caracteristica_imovel_id", :order => {"caracteristica_imovel_id" => :asc}
    t.index ["imovel_id"], :name => "fk__item_imovels_imovel_id", :order => {"imovel_id" => :asc}
    t.foreign_key ["caracteristica_imovel_id"], "caracteristica_imovels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_item_imovels_caracteristica_imovel_id"
    t.foreign_key ["imovel_id"], "imovels", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_item_imovels_imovel_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",               :limit => 80
    t.integer  "corretor_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.index ["corretor_id"], :name => "fk__users_corretor_id", :order => {"corretor_id" => :asc}
    t.index ["email"], :name => "index_users_on_email", :unique => true, :order => {"email" => :asc}
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true, :order => {"reset_password_token" => :asc}
    t.foreign_key ["corretor_id"], "pessoas", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_users_corretor_id"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], :name => "fk__roles_users_role_id", :order => {"role_id" => :asc}
    t.index ["user_id"], :name => "fk__roles_users_user_id", :order => {"user_id" => :asc}
    t.foreign_key ["role_id"], "roles", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_roles_users_role_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_roles_users_user_id"
  end

end
