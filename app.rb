require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#------Nomme les joueurs-----
player1 = Player.new("José")
player2 = Player.new ("Josiane") 


#------ Définition boucle-----
while player1.life_points > 0 and player2.life_points >0
   puts "A ma droite : #{player1.name} ! A ma gauche : #{player2.name} !\n"
    puts "\nVoici l'état de chaque joueur : "
  puts player1.show_state
  puts player2.show_state
  puts "\nPassons à la phase d'attaque :"
 # Joueur 1 attaque joueur 2 et si les hp de J2 >10 alors il attaque J1 et si hp j1 > 10 alors attaque j2 etc jusqu'à la mort
  player1.attacks(player2) #.attack rappelle methode attack de players.rb
 if player2.life_points <= 0
    break
  end
  player2.attacks(player1)
end



