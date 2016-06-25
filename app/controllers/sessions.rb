get '/sessions/new' do |variable|
	
	erb :'/sessions/new'
end

post '/sessions' do
	@user = User.find_by(email: params[:email])
	if @user && @user.password == params[:password]
		session[:user_id] = @user.id
		redirect '/'
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