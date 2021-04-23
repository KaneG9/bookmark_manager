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
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/add' do
    flash[:alert] = 'Error: Invalid URL entered' unless Bookmark.create(params[:add_url], params[:add_title])
    redirect('/')
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect('/bookmarks')
  end

  get '/update/:id' do
    @bookmark = Bookmark.find(params[:id])
    erb(:update)
  end

  patch '/update/:id' do
    Bookmark.update(params[:id], params[:update_url], params[:update_title])
    redirect('/bookmarks')
  end

  run if app_file == $PROGRAM_NAME
end
