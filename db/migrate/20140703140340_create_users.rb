class CreateUsers < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.references :attraction
      t.references :user
    end
  end
end
