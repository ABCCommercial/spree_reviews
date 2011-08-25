def valid_user!(options={})
  User.create(:email => 'test@example.com', :password => 'password', :password_confirmation => 'password')
end
