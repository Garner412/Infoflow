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
  p params[:id]
  comment = Comment.create(text: params[:comment_text], commentable_type: 'Question', commentable_id: params[:id], user_id: logged_in_user.id)
  p comment
  redirect '/' #redirect to question page with
end


get '/answers/:id/comments/new' do
  erb :'/comments/new'
end

post '/answers/:id/comments' do
  erb :'/home'
end
