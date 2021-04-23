# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/bookmark'
require 'pg'
require_relative './database_connection_setup'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    if session[:invalid_url]
      flash.now[:alert] = 'Error: Invalid URL entered'
      session[:invalid_url] = false
    end
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/add' do 
    if  params[:add_url].match(URI::regexp())
      Bookmark.create(params[:add_url], params[:add_title])
      redirect('/')
    else
      session[:invalid_url] = true
      redirect('/')
    end
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect('/bookmarks')
  end

  patch '/update/:id' do
    @bookmark = Bookmark.find(params[:id])
    erb(:update)
  end

  post '/update/confirm' do
    Bookmark.update(params['id'], params['update_url'], params['update_title'])
    redirect('/bookmarks')
  end

  run if app_file == $PROGRAM_NAME
end
