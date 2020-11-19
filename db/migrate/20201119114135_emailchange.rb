class Emailchange < ActiveRecord::Migration[5.2]
  def change
  add_column :emails, :status, :boolean
  end
end
