get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    # redirect '/' Change this back to home page
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/login' do
  if request.xhr?
    erb :'users/_login-form', layout: false
  else
    erb :'/users/login'
  end
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
    #add error message here
    erb :'/users/login'
  end
end

#add button to call logout on nav bar
get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/show' do #this is the user profile
    erb :'/users/show'
end
