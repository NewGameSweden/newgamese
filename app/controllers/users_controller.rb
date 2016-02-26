class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def send_usr_to_sverok(user)
    data = {
      "api_key" => "8WuLHZIhow7zutkpgvzPTo7JgVkUu7rW",
      "member" => {
        "firstname"=> user.first_name,
        "renewed"=> Date.today.to_s,
        "lastname"=> user.surname,
        "gender_id"=> 1,
        "co"=>[],
        "socialsecuritynumber"=> user.socialsecuritynumber,
        "email"=> user.email,
        "phone1"=> user.phone_number,
        "phone2"=>[],
        "street"=> user.address,
        "zip_code"=> user.postal_code,
        "city"=> user.postal_address
      }
    }
    uri = URI.parse('https://ebas.sverok.se/apis/submit_member.json')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    request.body = data.to_json
    puts data.to_json

    response = http.request(request)
    puts "Response"
    puts JSON.parse(response.body)
    redirect_to users_url
  end
  
end
