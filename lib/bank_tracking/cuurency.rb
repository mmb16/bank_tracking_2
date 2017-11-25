class BankTracking::Currency
  attr_accessor :Volume, :MarketName, :High, :Low, :Volume, :Last, :BaseVolume, :TimeStamp, :Bid, :Ask, :OpenBuyOrders, :OpenSellOrders, :PrevDay,
			:Created, :DisplayMarketName

@@all = []
  def initialize(currency)
    #setter
     currency.each {|key, value| self.send(("#{key}="), value)}
     @@all << self
  end

  def self.sort_by_volume
    @@all = @@all.sort_by {|attribute| attribute.Volume}
    @@all.reverse[0..10].each.with_index(1) do |name, i| puts "#{i}. #{name.MarketName} - Volume(000,000) #{name.Volume/100000} - Bid #{name.Bid} - Ask #{name.Ask}" end
  end

  def self.find_by_name(ticker)
    @@all.each do |name| if name.MarketName.include? "#{ticker}"
      puts "#{name.MarketName} - Volume(000,000) #{name.Volume/100000} - Bid #{name.Bid} - Ask #{name.Ask}"
      end
    end
  end

  def self.all
    @@all.each.with_index(1) do |name, i| puts "#{i}. #{name.MarketName} - #{name.Volume/100} - #{name.OpenBuyOrders.to_i/100000} - #{name.Bid}" end
  end
end
