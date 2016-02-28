class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def send_usr_to_sverok
    user = User.find(params[:id])
    data = {
      "api_key" => ENV["SVEROK_API_KEY"],
      "member" => {
        "firstname"=> user.first_name,
        "renewed"=> Date.today.to_s,
        "lastname"=> user.surname,
        "gender" => user.sex,
        "co"=>[],
        "socialsecuritynumber"=> user.social_security_number.to_s,
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

    response = http.request(request)
    response = JSON.parse(response.body)

    respond_to do |format|
      unless(response["member_errors"].nil?)
        format.html { redirect_to users_url, notice: response["member_errors"].to_s.gsub(/\[|\]|\"|\>|\{|\}/, '').gsub('=', ' ') }
        format.json { render json: @users }
      else
        format.html { redirect_to users_url, notice: 'Successfully sent user to Sverok' }
        format.json { render json: @users }
      end
    end
  end
end
