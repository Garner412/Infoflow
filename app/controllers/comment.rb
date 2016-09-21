# comment/new

# get - question/:id/comments/new
# post
# answer/:id/comments/new

get '/question/:id/comments/new' do
  @question = Question.find(params[:id])
  erb :'/comments/new'
end


post '/question/:id/comments' do
  Comment.new(commentable_type: 'Question', )
  erb :'/comments/new'
end


get '/answer/:id/comments/new' do
  erb :'/comments/new'
end

post '/answer/:id/comments' do
  erb :'/comments/new'
end
