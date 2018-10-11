require 'rubygems'
require 'nokogiri'   
require 'open-uri'


def crypto_value
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  x = 0
  price = Array.new
  var = page.css("a.price").each do |link|
    price[x] = link.text
    x += 1
  end
  return price
end

def crypto_name
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  x = 0
  name = Array.new
  var = page.css("td.currency-name").each do |link|
    name[x] = link["data-sort"]
    x += 1
  end
  return name
end

def create_hash(name, price)
  x = 0
  hash_crypto = Hash.new
  while name[x]
    hash_crypto[x] = {
            "Name" => name[x],
            "Price" => price[x]
    }
    x += 1
  end
  x = 0
  while name[x]
    puts hash_crypto[x]["Name"]
    puts "Valeur: #{hash_crypto[x]["Price"]} \n\n"
    x += 1
  end
end

fin_du_monde = 0
while fin_du_monde == 0
  create_hash(crypto_name, crypto_value)
  sleep(3600)
end
