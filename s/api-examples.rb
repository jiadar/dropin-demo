require 'rest-client'
require 'neatjson'

UID=342261100
GID=37154852

def run_api(a)
  url = "http://localhost:3000/#{a}"
  params = {user_email: 'ross@teamengine.org', user_token: 'qvn4Z6DRFovrvSDpP8aD' }
  request = RestClient.get url, :params => params
  j = JSON.parse(request.body)
  opts = { short:true, wrap:60, decimals:3, sort:true, aligned:true,
           padding:1, after_comma:1, around_colon_n:1 }
  puts JSON.neat_generate(j, opts)
end

def run_all_working
  puts "Get all the user IDs" 
  run_api %Q(api/v1/users/index)

  puts "Get public info for a user" 
  run_api %Q(api/v1/users/public/#{UID})

  puts "Get private info for a user" 
  run_api %Q(api/v1/users/private/#{UID})

  puts "Get preferences info for a user" 
  run_api %Q(api/v1/users/preferences/#{UID})
  
  puts "Get all the Gym IDs" 
  run_api %Q(api/v1/gyms/index)

  puts "Get gym information by a Gym ID" 
  run_api %Q(api/v1/gyms/id/#{GID})

  puts "Get user credits"
  run_api %Q(api/v1/ledger/balance/?user_id=#{UID}&query=sum)

  puts "User's current subscription"
  run_api %Q(api/v1/subscriptions/user?user_id=#{UID})

  puts "Gyms to which the user has membership through the subscription"
  run_api %Q(api/v1/memberships/user?user_id=#{UID})

  puts "favorite gyms"
  run_api %Q(api/v1/favorites/user?user_id=#{UID})

end

run_all_working


#puts "user favorite gyms(: list 5)"
#puts "user recent activity :slightly_smiling_face: list 5)"
                                                      


# future:

  
# puts "Search user by ID" 
# run_api %Q(api/v1/users/search?id=#{UID})

# puts "Search user by Name (regex)" 
# run_api %Q(api/v1/users/search?name=ross)

# puts "Search user by username (exact)"
# run_api %Q(api/v1/users/search?username=jiadar)

# puts "Search user by location"
# run_api %Q(api/v1/users/search?location=2%20Poncetta%20Drive%2C%20Daly City%2C%20CA%2094015)




