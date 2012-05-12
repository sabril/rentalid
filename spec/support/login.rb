def login(user)
  post user_session_path, :email => user.email, :password => 'password'
end