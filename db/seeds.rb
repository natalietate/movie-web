User.destroy_all

 # Create dummy users
user = User.create! :email => 'test@test.com', :password => 'testing', :password_confirmation => 'testing'
