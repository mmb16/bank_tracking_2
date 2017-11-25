#CLI Controller
class BankTracking::CLI

  def call
    puts "Welcome to banking"
    get_markets
    menu
  end

  def get_markets
    @get_markets = BankTracking::API.get_markets
  end

  def sort_by_volume
    @volume = BankTracking::Currency.sort_by_volume
    puts "#{@transaction}"
  end

  def find_by_ticker(ticker)
    @tickers = BankTracking::Currency.find_by_name(ticker)
  end

  def menu
    puts "What would you like to do? 1. Sort by volume, 2. Find by ticker, or type exit"
    input = nil
    ticker = nil
    while input != "exit"
      input = gets.strip
      if input == "1"
        sort_by_volume
      elsif input == "2"
        puts "Input ticker: (ETH, BTC ...)"
        ticker = gets.strip
          puts "tickers are: "
          find_by_ticker(ticker)
      else
        get_markets
      end
    end
  end

end
