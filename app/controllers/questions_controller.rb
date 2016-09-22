get '/questions/new' do
  if logged_in?
    erb :'/questions/new'
  else
    redirect '/'
  end
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

post "/questions/:id/vote" do
  vote = Vote.create(voteable_id: params[:id], voteable_type: "Question")
  @question = Question.find(vote.voteable_id)
  # if Comment.find(vote.voteable_id)
  #    @comment = Comment.find(vote.voteable_id)
    if request.xhr?
      @question.votes.count.to_s
    else
      redirect "/questions/#{@question.id}"
    end
  # end
end

get '/questions/:id/edit' do
  if Question.find(params[:id]) != nil
    @question = Question.find(params[:id])
    if logged_in_user.try(:id) == @question.user_id
      erb :'questions/edit'
    end
  else
    redirect '/'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @comments = Comment.where(user_id: params[:id])
  # @votes
  @answers = Answer.where(question_id: params[:id])
  # @vote_array = Vote.where(params[:id], voteable_type: "Question").count

  erb :'/questions/show'
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


