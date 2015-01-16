class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.belongs_to :league
      t.belongs_to :club
      
      t.string :name
      t.integer :age
      t.string :coach
      t.float :ppg
      
      t.timestamps
    end
  end
end
