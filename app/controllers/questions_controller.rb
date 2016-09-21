get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = logged_in_user.questions.build(params[:question])
  # @question = Question.new(user_id: logged_in_user.id, title: params[:title], question: params[:content])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id/edit' do
  if Question.find(params[:id]) != nil
    if logged_in_user.try(:id) == question.user_id
      p @question.user_id
      erb :'questions/edit'
    end
  else
    redirect '/'
  end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])
  if logged_in_user.try(:id) == @question.user_id
    @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/edit'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @comments = Comment.where(user_id: params[:id])
  # @votes
  @answers = Answer.where(question_id: params[:id])
  erb :'/questions/show'
end
