# frozen_string_literal: true

class RemoveAddressFromEvent < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :address
  end
end
