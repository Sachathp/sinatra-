require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do 
    erb :new_gossip
  end

  post '/gossips/new/' do

    gossip_author = params["gossip_author"]
    gossip_content = params["gossip_content"]

    Gossip.new(gossip_author, gossip_content).save

    redirect '/'
  end

  get '/gossips/:id' do 
    @gossip = Gossip.find(params['id'])
    erb :show
  end   
end


#post '/gossips/new/' do
    #puts "Salut, je suis dans le serveur"
    #puts "Ceci est le contenu du hash params : #{params}"
    #puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    #puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    #puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  #end
#end

