# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_05_03_020647) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendamentos", force: :cascade do |t|
    t.string "descricao"
    t.date "data_hora"
    t.string "tipo"
    t.bigint "evento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_agendamentos_on_evento_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "rg"
    t.date "data_nascimento"
    t.string "profissao"
    t.string "nacionalidade"
    t.string "endereco"
    t.string "forma_pagamento"
    t.integer "parcelas"
    t.decimal "valor_total"
    t.text "observacoes"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_clientes_on_usuario_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.string "nome_evento"
    t.date "data_evento"
    t.string "local"
    t.string "descricao"
    t.string "status"
    t.bigint "cliente_id", null: false
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_eventos_on_cliente_id"
    t.index ["usuario_id"], name: "index_eventos_on_usuario_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "place"
    t.text "description"
    t.string "status"
    t.text "supplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fornecedors", force: :cascade do |t|
    t.string "nome_fornecedor"
    t.string "contato"
    t.string "email"
    t.string "tipo_servico"
    t.string "observacoes"
    t.bigint "evento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_fornecedors_on_evento_id"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.decimal "valor_pago"
    t.date "data_pagamento"
    t.string "forma_pagamento"
    t.string "status"
    t.bigint "cliente_id", null: false
    t.bigint "evento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pagamentos_on_cliente_id"
    t.index ["evento_id"], name: "index_pagamentos_on_evento_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "senha_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agendamentos", "eventos"
  add_foreign_key "clientes", "usuarios"
  add_foreign_key "eventos", "clientes"
  add_foreign_key "eventos", "usuarios"
  add_foreign_key "fornecedors", "eventos"
  add_foreign_key "pagamentos", "clientes"
  add_foreign_key "pagamentos", "eventos"
end
