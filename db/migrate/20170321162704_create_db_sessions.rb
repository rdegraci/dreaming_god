class CreateDbSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :db_sessions do |t|
      t.string :sessionId
      t.string :userId
      t.timestamps
    end
  end
end
