



get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'/answers/new'
end


post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  answer = Answer.create(body: params[:answer_form], user_id: logged_in_user.id, question_id: params[:id])
  redirect "/questions/#{params[:id]}"
end
