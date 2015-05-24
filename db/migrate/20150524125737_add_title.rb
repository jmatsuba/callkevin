class AddTitle < ActiveRecord::Migration
  def change
    change_table :kevin_requests do |t|
      t.string :title
      t.rename :name, :user_name
    end
  end
end
