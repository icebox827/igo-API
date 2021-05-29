class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :password
end
