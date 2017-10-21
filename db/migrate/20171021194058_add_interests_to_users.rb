class AddInterestsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :interest, :string
  end
end
