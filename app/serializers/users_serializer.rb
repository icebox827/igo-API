class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :password, :email, :admin
end
