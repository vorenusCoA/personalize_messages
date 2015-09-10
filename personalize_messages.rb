#solicitamos la gem de twitter
require 'twitter'

#instanciamos un nuevo cliente con los datos de nuestra app
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "XXXX"
  config.consumer_secret     = "XXXX"
  config.access_token        = "XXXX"
  config.access_token_secret = "XXXX"
end

#función para traer todos nuestros followers a un array
#agradecimientos a @carohadad
def get_followers(client, user_id)
  results = []
  next_cursor = -1
  while next_cursor != 0
    cursor = client.followers(user_id, :cursor => next_cursor)
    results.push(cursor.attrs[:users])
    next_cursor = cursor.send(:next_cursor)
  end
  return results
end

followers = get_followers(client, client.user)

#formar un hash sólo con el nombre (key) y el screen_name (value) de cada follower
i = 0
followers_names = {}
while i < followers[0].length do
  followers_names.store(followers[0][i][:name], followers[0][i][:screen_name])
  i += 1
end

#mandar un mensaje directo a cada follower
followers_names.each do |key, value|
  client.create_direct_message(value, "Feliz año #{key}!") 
end