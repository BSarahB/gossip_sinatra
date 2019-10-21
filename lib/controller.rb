require 'gossip'

class ApplicationController < Sinatra::Base

#route pour l index, on envoie l array de gossips, obtenu en declenchant la methode self.all dans la classe Gossip(self = Gossip)
get '/' do
  erb :index, locals: {gossips: Gossip.all}
end


# En GET, Sinatra comprend: "si clic URL /gossips/new/ envoie-lui les view new_gossip"
 get '/gossips/new/' do
    erb :new_gossip
  end

#en POST, récupère les informations du formulaire et convertis-les en une création de gossip dans ma base
 post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save_as_CSV
  redirect '/'
end

#je recupere du hash id et l envoie dans show.erb via cette route get grace a la methode locals
  get '/gossips/:id' do
    erb :show, locals: {id: params["id"], gossips: Gossip.find(params["id"])} 
  end

end