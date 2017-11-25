class BankTracking::API

  def self.get_markets
    data = RestClient.get("https://bittrex.com/api/v1.1/public/getmarketsummaries")
    @parsed_markets = JSON.parse(data)
    @parsed_markets.each do  |transaction|
      if transaction.include?("result")

        transaction.each do |coin_array|
          if coin_array != "result"
            
          coin_array.each do |coin_hash|
            BankTracking::Currency.new(coin_hash)
            end
          end
        end
      end
    end
  end
end
