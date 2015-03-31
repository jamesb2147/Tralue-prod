class AddAirlineCostsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :cxcostpts, :integer
    add_column :trips, :cxcostusd, :decimal
    add_column :trips, :brcostpts, :integer
    add_column :trips, :brcostusd, :decimal
    add_column :trips, :eycostpts, :integer
    add_column :trips, :eycostusd, :decimal
    add_column :trips, :afcostpts, :integer
    add_column :trips, :afcostusd, :decimal
    add_column :trips, :gacostpts, :integer
    add_column :trips, :gacostusd, :decimal
    add_column :trips, :mhcostpts, :integer
    add_column :trips, :mhcostusd, :decimal
    add_column :trips, :qfcostpts, :integer
    add_column :trips, :qfcostusd, :decimal
    add_column :trips, :qrcostpts, :integer
    add_column :trips, :qrcostusd, :decimal
    add_column :trips, :tgcostpts, :integer
    add_column :trips, :tgcostusd, :decimal
    add_column :trips, :vscostpts, :integer
    add_column :trips, :vscostusd, :decimal
    add_column :trips, :azcostpts, :integer
    add_column :trips, :azcostusd, :decimal
    add_column :trips, :nhcostpts, :integer
    add_column :trips, :nhcostusd, :decimal
    add_column :trips, :amcostpts, :integer
    add_column :trips, :amcostusd, :decimal
    add_column :trips, :lycostpts, :integer
    add_column :trips, :lycostusd, :decimal
    add_column :trips, :hacostpts, :integer
    add_column :trips, :hacostusd, :decimal
    add_column :trips, :ibcostpts, :integer
    add_column :trips, :ibcostusd, :decimal
    add_column :trips, :vxcostpts, :integer
    add_column :trips, :vxcostusd, :decimal
    add_column :trips, :abcostpts, :integer
    add_column :trips, :abcostusd, :decimal
    add_column :trips, :cacostpts, :integer
    add_column :trips, :cacostusd, :decimal
    add_column :trips, :nzcostpts, :integer
    add_column :trips, :nzcostusd, :decimal
    add_column :trips, :ozcostpts, :integer
    add_column :trips, :ozcostusd, :decimal
    add_column :trips, :mucostpts, :integer
    add_column :trips, :mucostusd, :decimal
    add_column :trips, :czcostpts, :integer
    add_column :trips, :czcostusd, :decimal
    add_column :trips, :ekcostpts, :integer
    add_column :trips, :ekcostusd, :decimal
    add_column :trips, :g3costpts, :integer
    add_column :trips, :g3costusd, :decimal
    add_column :trips, :hucostpts, :integer
    add_column :trips, :hucostusd, :decimal
    add_column :trips, :jlcostpts, :integer
    add_column :trips, :jlcostusd, :decimal
    add_column :trips, :lhcostpts, :integer
    add_column :trips, :lhcostusd, :decimal
    add_column :trips, :svcostpts, :integer
    add_column :trips, :svcostusd, :decimal
    add_column :trips, :vacostpts, :integer
    add_column :trips, :vacostusd, :decimal
  end
end
