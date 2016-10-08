class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.belongs_to :user, index: true, foreign_key: true

      t.index %i(provider uid), unique: true
    end
  end
end
