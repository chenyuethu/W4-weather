# DON'T CHANGE THIS CODE
# ----------------------
require "net/http"
require "json"
url = "https://weatherdbi.herokuapp.com/data/weather/chicago"
uri = URI(url)
response = Net::HTTP.get(uri)
weather_data = JSON.parse(response)
# ----------------------

# EXERCISE
# Using the Ruby hash `weather_data` that includes weather forecast data for Chicago,
# write a weather summary out to the screen including the current conditions and upcoming forecast.
# Something like the output below.

puts weather_data

# Sample output:
# In Chicago, IL it is currently 67 degrees and cloudy.
# The rest of today will be a high of 65 and scattered shows.
# The upcomming weather forecast is:
# Wednesday: a high of 65 and scattered showers.
# Thursday: a high of 67 and partly cloudy.
# Friday: a high of 59 and rain.
# Saturday: a high of 77 and cloudy.
# ...


# STEPS
# Look at the weather_data hash.
# Find the current data.
# Build a string with the text and dynamic data from the hash.
# "In #{...} it is currently #{...} degrees and #{...}"

location = weather_data["region"]
current_degree = weather_data["currentConditions"]["temp"]["f"]
current_weather = weather_data["currentConditions"]["comment"]

puts "In #{location} it is currently #{current_degree} degrees and #{current_weather}"

# Find the array of forecast data.
# Read only the first element of that array to display the conditions for the rest of today.

today_forecast_degree = weather_data["next_days"][0]["max_temp"]["f"]
today_forecast_weather = weather_data["next_days"][0]["comment"]

puts "The rest of today will be a high of #{today_forecast_degree} and #{today_forecast_weather}."


# Use a loop to display the daily summary for the upcoming forecast.
puts "The upcomming weather forecast is:"
for forecast in weather_data["next_days"]
    day = forecast["day"]
    max = forecast["max_temp"]["f"]
    weather = forecast["comment"]
    puts "#{day}: a high of #{max} and #{weather}"
end



# 1. inspect the weather_data hash
# puts weather_data

# CHALLENGE
# Can you display the weather forecast summary for a user-entered city?
# Use the following code at the very top of the file and then replace "chicago" in the api url with the user-entered city:
# puts "What city are you in?"
# city = gets.chomp
# puts city
# Note: what happens if the user-entered value is not a known city? You'll want to do some error handling.