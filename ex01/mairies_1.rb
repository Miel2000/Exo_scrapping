require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
  mails = page.css("tr")
  puts mails.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end

get_the_email_of_a_townhal_from_its_webpage

