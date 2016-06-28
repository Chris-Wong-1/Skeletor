get '/sessions/new' do

	erb :'/sessions/new'
end

post '/sessions' do
	@user = User.find_by(email: params[:email])
	if @user && @user.authenticate?(params[:password])
		login(@user)
		redirect "/users/#{session[:user_id]}"
	else
		@error = "Email and password do not match"
		redirect '/sessions/new'
	end
end

get '/sessions/delete' do
	session[:user_id] = nil
  current_user = nil

	erb :'index'
end
