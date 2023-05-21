# frozen_string_literal: true

class CreateFlows < ActiveRecord::Migration[7.0]
  def change
    create_table :flows do |t|
      t.string :slug, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :schema, null: false
      t.string :fields, null: false

      t.references :author, null: false, foreign_key: { to_table: :users }, index: true
      t.references :account, null: false, foreign_key: true, index: true

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
