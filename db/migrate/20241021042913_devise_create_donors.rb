# frozen_string_literal: true

class DeviseCreateDonors < ActiveRecord::Migration[7.2]
  def change
    create_table :donors do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_atS

      t.timestamps null: false
    end

    add_index :donors, :reset_password_token, unique: true
    # add_index :donors, :confirmation_token,   unique: true
    # add_index :donors, :unlock_token,         unique: true
  end
end
