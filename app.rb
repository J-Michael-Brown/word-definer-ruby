require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word.rb')
require('pry')

get('/') do
  @dictionary = Word.all
  erb(:index)
end

post('/alphabetical') do
  @dictionary = Word.alphabetical
  erb(:index)
end

post('/chronological') do
  @dictionary = Word.all
  erb(:index)
end

get('/create_new_words') do
  erb(:create_new_words)
end

post('/create_new_words') do
  new_term = params.fetch('new-term')
  new_definition = params.fetch('first-definition')
  if new_definition == ""
    new_word = Word.new(new_term)
  else
    new_word = Word.new(new_term, [new_definition])
  end

  @dictionary = Word.add_to_lib(new_word)
  erb(:create_new_words)
end

get('/definitions/:term') do
  @word = Word.find_word_by_term(params[:term])

  erb(:definitions)
end

post('/definitions/:term') do
  @word = Word.find_word_by_term(params[:term])
  new_definition = params.fetch('new-definition')
  Word.add_define(@word, new_definition)
  @word = Word.find_word_by_term(params[:term])
  erb(:definitions)
end
