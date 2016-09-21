get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    # redirect '/' Change this back to home page
    erb :'/users/show'
  else
    #add login error here
    erb :'/user/new'
  end
end

get '/login' do
  erb :'/users/login'
end


post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    #add error message here
    erb :'/user/login'
  end
end

#add button to call logout on nav bar
get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/show' do #this is the user profile
  if !logged_in?
  else
    #add info to display on user page here
    @user = User.find(session[:user_id])
    erb :'/users/show'
  end
  erb :'users/login'
end
