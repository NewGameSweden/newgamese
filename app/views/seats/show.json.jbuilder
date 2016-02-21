json.extract! @seat, :id, :number, :created_at, :updated_at
if @user
  json.extract! @user, :first_name, :surname, :username
end
