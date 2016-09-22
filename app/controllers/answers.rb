get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'/answers/new'
end


post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  answer = Answer.create(body: params[:answer_form], user_id: logged_in_user.id, question_id: params[:id])
  redirect "/questions/#{params[:id]}"
end

post "/answers/:id/vote" do
  vote = Vote.create(voteable_id: params[:id], voteable_type: "Answer")
  answer = vote.voteable_type.classify.constantize.find(vote.voteable_id)
  @question = Question.find(answer.question_id)
  if request.xhr?
    answer.votes.count.to_s
  else
    redirect "/questions/#{@question.id}"
  end
end
