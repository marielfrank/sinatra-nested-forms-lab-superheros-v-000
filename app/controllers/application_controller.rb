require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  post '/teams' do
    @team = Team.new(params[:team])

    params[:team][:members].each do |member_info|
      Member.new(member_info)
    end

    @members = Member.all
    binding.pry
    erb :teams
  end

end
