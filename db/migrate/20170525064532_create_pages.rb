# frozen_string_literal: true
class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :url
      t.json :content
      t.timestamps
    end
  end
end
