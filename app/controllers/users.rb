get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    #add login error here
    erb :'/user/new'
  end
end

get '/login' do
  erb :'user/login'
end


post '/login' do

end
