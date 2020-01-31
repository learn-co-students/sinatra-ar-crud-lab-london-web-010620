
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/articles'
  end

  #index

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #new

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  #show 

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #create

  post '/articles' do 
    @article = Article.create(:title => params[:title], :content => params[:content])
    redirect to "/articles/#{@article.id}"
  end

  # edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{ @article.id }"
  end

  #destroy

  delete "/articles/:id" do 
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end

end
