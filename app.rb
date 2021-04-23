# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/bookmark'
require 'pg'
require_relative './database_connection_setup'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/add' do
    Bookmark.create(params[:add_bookmark], params[:add_name])
    redirect('/')
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
