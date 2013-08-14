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

ActiveRecord::Schema.define(:version => 20130814163400) do

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

  create_table "enderecos", :force => true do |t|
    t.string   "logradouro",  :limit => 400
    t.string   "bairro",      :limit => 100
    t.string   "cidade",      :limit => 120
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "corretor_id"
    t.foreign_key ["corretor_id"], "corretors", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_corretors"
  end

  create_table "images", :force => true do |t|
    t.string   "image"
    t.integer  "imovel_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "imovel_detalhes", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "imovel_detalhes_imovels", :id => false, :force => true do |t|
    t.integer "imovel_detalhe_id"
    t.integer "imovel_id"
  end

  create_table "imovel_tansacaos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "imovel_tipos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "imovels", :force => true do |t|
    t.string   "codigo_referencia",   :limit => 10
    t.string   "nome",                :limit => 200
    t.string   "localizacao",         :limit => 200
    t.text     "descricao"
    t.decimal  "taxa_condominio",                    :precision => 8, :scale => 2
    t.decimal  "iptu",                               :precision => 8, :scale => 2
    t.decimal  "valor",                              :precision => 9, :scale => 2
    t.decimal  "area",                               :precision => 7, :scale => 2
    t.integer  "vagas_garagem"
    t.integer  "transacao_imovel_id"
    t.integer  "tipo_imovel_id"
    t.integer  "responsavel_id"
    t.integer  "vendedor_id"
    t.integer  "cadastrado_por_id"
    t.boolean  "vendido"
    t.boolean  "ativo"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "quantidade_quartos"
    t.integer  "quantidade_suites"
    t.foreign_key ["cadastrado_por_id"], "corretors", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_imovels_cadastrado_por"
    t.foreign_key ["responsavel_id"], "corretors", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_imovels_responsavel"
    t.foreign_key ["vendedor_id"], "corretors", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_imovels_vendedor"
  end

  create_table "item_imovels", :force => true do |t|
    t.boolean  "visibilidade"
    t.string   "quantidade",               :limit => 60
    t.integer  "imovel_id"
    t.integer  "caracteristica_imovel_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "tipo_imovels", :force => true do |t|
    t.string   "nome",                 :limit => 100
    t.integer  "contador_tipo_imovel",                :default => 0, :null => false
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  create_table "transacao_imovels", :force => true do |t|
    t.string   "descricao",  :limit => 180
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.integer  "corretor_id"
    t.index ["corretor_id"], :name => "fk__users_corretor_id", :order => {"corretor_id" => :asc}
    t.index ["email"], :name => "index_users_on_email", :unique => true, :order => {"email" => :asc}
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true, :order => {"reset_password_token" => :asc}
    t.foreign_key ["corretor_id"], "corretors", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_users_corretor_id"
  end

end
