get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id/edit' do
  @question = find_and_ensure_entry(params[:id])
  if logged_in_user.try(:id) == @question.user_id
    erb :'/questions/edit'
  else
    redirect '/'
  end
end

put '/questions/:id' do
  @question.assign_attributes(params[:question])
  if logged_in_user.try(:id) == @question.user_id
    @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/edit'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @comments = Comment.where(user_id: params[:id])
  # @votes
  @answers = Answer.where(question_id: params[:id])
  erb :'/questions/show'
end
