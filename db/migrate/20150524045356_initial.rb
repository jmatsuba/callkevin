class Initial < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :handle
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :kevin_requests do |t|
      t.string :name
      t.string :description
      t.string :incentive
      t.datetime :created_at
      t.datetime :updated_at
    end

  end
end
