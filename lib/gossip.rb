  require 'csv'

class Gossip
  attr_accessor :content, :author

  def initialize(author, content)

    @content = content
    @author = author
  end
    

  def save_as_CSV

    CSV.open("./db/gossip.csv", "ab") do |csv|
	   csv << [@author, @content]

    end  
  end
  
  def self.all
      # 1)création d'un array vide qui s'appelle all_gossips
      all_gossips = []
      #2)chaque ligne de ton CSV.each do |ligne|
      file = CSV.read("./db/gossip.csv")
      file.each do |ligne|
 	#ligne nous renvoie un array avec les 2 strings du gossip ["sarah", "pas de potins"]
      gossip_provisoire = Gossip.new(ligne[0],ligne[1])	
      all_gossips << gossip_provisoire
      end
      	
      #3)return all_gossips - on renvoie le résultat
      return all_gossips
  end
 
  def self.find(id)
    id = id.to_i # on convertit la string en integer pour pouvoir renseigner l index de l array just en dessous
    return self.all[id] #self.all n est autre que Gossip.all ainsi on prend l index de l array
  end

end
