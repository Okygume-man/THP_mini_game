# class de version 1.0
class Player
	 attr_accessor :name, :life_points 
 	
	 # initialiser la class
  def initialize(name) 
        @name = name  
        @life_points = 10
  end

  def show_state
    	puts "#{@name} a encore ses #{@life_points}pts"
  end

  def gets_damage(damages)
    @life_points -= damages
    if @life_points <= 0
      puts "Le joueur #{@name} est mort"
      @life_points = 0
    end
  end

  def attacks(player)
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "#{@name} inflige #{damage} points de dommages"
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6) # dommage alétatoire.
  end

end

puts "PLAYER INFO"

# Version 2.0

class Humanplayer < Player # nouvelle classe qui hérite caractérique de classe Player.

	attr_accessor :weapon_level

  def weapon_level(name)
    super(name) # rappel l'initialize de la classe mère Player
    @life_points = 100
    @weapon_level = 1
  end


  def show_state
    "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end


  def compute_damage
    rand(1..6) * @weapon_level #inflige dommage aléatoire multiplié par par weapon_level
  end

  def search_weapon
  	 dice =rand(1..6) #lance dé 6 faces
  	 puts "Tu as une trouvé une arme de niveau #{dice} !" # résultat dé
  	 if dice > @weapon_level.to_i
  	 	@weapon_level = dice # si résultat dé > weapon_level alors valeur weapon_level devient "dé"
  	 	puts "Wooow elle est plus puissante que ton arme actuelle"
  	 else
  	 	puts "Tsss c'est qu'un bout de bois"
  	 end
  end

  def search_health_pack
  	health_pack = rand(1..6)
  	if health_pack == 1
  		puts "Tu n'as rien trouvé...."
  	elsif health_pack == 6
  		@life_points = [100, @life_points + 80].min
  		puts "Waow, tu as trouvé +80 points de vie"
  	else 
  		@life_points = [100, @life_points + 50].min
  		puts "Bravo, tu as trouvé un pack de +50pts de vie !"
   end
end
end
