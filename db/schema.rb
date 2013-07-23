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

ActiveRecord::Schema.define(:version => 20130706040107) do

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
    t.string   "cod_ref"
    t.string   "nome"
    t.string   "localizacao"
    t.text     "descricao"
    t.integer  "taxa_de_condominio"
    t.integer  "iptu"
    t.integer  "valor"
    t.integer  "quartos"
    t.integer  "suites"
    t.integer  "area"
    t.integer  "vagas"
    t.integer  "imovel_transacao_id"
    t.integer  "imovel_tipo_id"
    t.integer  "responsavel_id"
    t.integer  "vendedor_id"
    t.integer  "cadastrado_por_id"
    t.boolean  "vendido"
    t.boolean  "ativo"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
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
    t.string   "name"
    t.string   "cpf"
    t.string   "tel"
    t.string   "cel"
    t.string   "rg"
    t.string   "ende"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
