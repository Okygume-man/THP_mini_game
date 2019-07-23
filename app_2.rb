require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-_-_-_-_-_-_-têtedeblasé-_-_-_-_-"
puts "|||Bienvenue sur 'ILS VEULENT TOUS MA POO' ! "
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "°))°))°))°))°))°))°))°))°))°))°))°))°))°"

# Appel class Player (mère)
player1 = Player.new("José")
player2 = Player.new ("Josiane") 

#Appel class HumanPlayer (fille)
#Initialisation du joueur
puts "Donne moi un nom combat"
name1 = gets.chomp
user = Humanplayer.new(name1)
#Initialisation des ennemies (bots)
array_enemies=[player1, player2]

#On lance le combat
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
	puts "Voici l'état de #{user.show_state}"
	puts "Quelle action veux-tu effectuer ?"
  
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "

  puts "Attaquer un joueur en vue :"
  array_enemies.each_with_index do |bots, index| # va chercher dans tableau valeur HP et l'index en conséquence.
    if bots.life_points > 0
      puts "#{index} - #{bots.show_state}"
    	end
    end
  puts "Selectionne un action proposé"
    choice = gets.chomp
	if choice == "a"
	  user.search_weapon
	elsif choice == "s"
	  user.search_health_pack
	elsif choice == "0"
		user.attacks(player1)
	elsif choice == "1"
      user.attacks(player2)
    else
    	puts "Tu dois choisir entre 0; 1; a; s"
    end

array_enemies.each do |bots| # si un bots à une vie supérieur à 0 il attaque user
	if bots.life_points > 0
		bots.attacks(user)
	end
end
end
puts "Fin du jeu"
#Fin du jeu
if user.life_points > 0
	puts "Bravo tu as gagné coco"
else
	puts "Loser ! Tu as perdu"
end	
