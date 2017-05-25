# frozen_string_literal: true
class AddContentStatusToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :content_status, :string, default: 'waiting'
  end
end
