class CreateFundVerticals < ActiveRecord::Migration
  def change
    create_table :fund_verticals do |t|
      t.string :title
      t.integer :council_spend
      t.integer :nhs_spend
      t.integer :trend
      t.references :area
      t.references :audience
      t.timestamps
    end
  end
end
