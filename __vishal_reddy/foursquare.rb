require 'rubygems'
require 'foursquare2'
require 'pry'

class Venue
  attr_accessor :name, :contact, :address, :city, :state, :checkins
  def initialize(info)
    @name = info[:name]
    @contact = info[:contact]
    @address = info[:address]
    @city = info[:city]
    @state = info [:state]
    @checkins = info[:checkins]
  end

def to_s
    "#{name}; Contact: #{contact}; Address: #{address}, #{city}, #{state}; Check-ins Count: #{checkins}"
  end

end

class Foursquare
  attr_accessor :venue_info
    def initialize
    @venue_info = []
    end

  def client
  @client = Foursquare2::Client.new(:client_id => 'LBQ3DE5P2E4A4LLBCNUGGVZ53HPSQYOVF4TUZSSUTUIU3MIR', :client_secret => 'IKP1AR5YMB5J0VKYFNP3OL01E03ZLMR5MKJVS5MRG2MLNQID')
  end

  def display_venue_info
    venue_info.join("\n")
  end

  def bad_input
  puts "Sorry, there was a problem processing your request. Please try again."
  get_info
  end 

  def user_params
    puts "Please enter your city name."
    city = gets.strip.to_s.capitalize
    puts "Please enter your two-letter state code."
    state = gets.strip.to_s.upcase
    location = "#{city}, #{state}" 
    puts "What are you looking for?"
    query = gets.strip.to_s
  end

  def get_info
    client
    user_params
    response = client.search_venues(:near => "#{location}", :query => "#{query}", :limit => 5, :intent => 'checkin')
    unless response.is_a? Hash
      bad_input
    else
      relevant_response = response["groups"][0]["items"]
      relevant_response.each do |venue|
      venue_name = venue["name"]
      venue_contact = venue["contact"]["formattedPhone"]
      venue_address = venue["location"]["address"]
      venue_city = venue["location"]["city"]
      venue_state = venue["location"]["state"]
      venue_checkins = venue["stats"]["checkinsCount"]
      @venue_info << Venue.new({name: venue_name, contact: venue_contact, address: venue_address, city: venue_city, state: venue_state, checkins: venue_checkins})
    end
  end
end 

foursquare = Foursquare.new

puts "Welcome to Finderoo!  Enter your location and what you're looking for (i.e. Starbucks, donuts, Olive Garden, etc.) 
and get the top 5 hits that match your request. You'll get the name of the venue, address, contact information, and the 
number of times people have checked-in via Foursquare."
foursquare.get_info

puts foursquare.display_venue_info

