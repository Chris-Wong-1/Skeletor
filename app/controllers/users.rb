get '/users/new' do

	erb :'/users/new'
end

post '/users' do
	@user = User.new(username: params[:username], email: params[:email], password: params[:password])
	if @user.save
		session[:user_id] = @user.id
		redirect '/'
	else
		redirect '/users/new'
	end
end

get '/users/:id' do
  "Welcome to your profile page"

end
