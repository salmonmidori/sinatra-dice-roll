require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  sum = 0
  dice = Array.new
  2.times do |x|
    dice[x] = rand(1..6)
    sum += dice[x]
  end

  @outcome = "You rolled a #{dice[0]} and #{dice[1]} for a total of #{sum}."
  erb(:two_six)

end


get("/dice/2/10") do
  sum = 0
  dice = Array.new
  2.times do |x|
    dice[x] = rand(1..10)
    sum += dice[x]
  end

  @outcome = "You rolled a #{dice[0]} abd #{dice[1]} for a total of #{sum}."
  erb(:two_ten)
end


get("/dice/1/20") do

  first_die = rand(1..20)

  @outcome = "You rolled a #{first_die}."
  erb(:one_twenty)
end


get("/dice/5/4") do
  sum = 0
  dice = Array.new
  5.times do |x|
    dice[x] = rand(1..4)
    sum += dice[x]
  end

  @outcome = "You rolled a #{dice[0]}, #{dice[1]}, #{dice[2]}, and #{dice[3]} for a total of #{sum}."
  erb(:five_four)
end
