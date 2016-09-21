get '/' do
    @questions = Question.all
  erb :'/home'
end
