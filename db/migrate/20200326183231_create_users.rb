class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email      
      t.string :access_token
      t.string :token_type 
      t.string :expires_in 
      t.string :refresh_token 
      t.timestamps
    end
  end
end
