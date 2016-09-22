# comment/new

# get - question/:id/comments/new
# post
# answer/:id/comments/new

get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  erb :'/comments/new'
end


post '/questions/:id/comments' do
  @question = Question.find(params[:id])
  comment = Comment.create(text: params[:comment_text], user_id: logged_in_user.id,  commentable_id: params[:id], commentable_type: 'Question')
  redirect "/questions/#{params[:id]}"
end


get '/answers/:id/comments/new' do
  # @answer = Answer.find(params[:id])
  # answer = Answer.create(id: params[:id], user_id: @answer.user_id, body )
  # redirect "/questions/#{params[:id]}" #link answer to question id
end

# post '/answers/:id/comments' do
#   @answer = Answer.find(params[:id])
#   comment = Comment.create(id: params[:id], user_id: @answer.user_id, body )
#   redirect "/questions/#{params[:id]}" #link answer to question idend
# end
