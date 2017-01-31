//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Alexander Silkin on 1/30/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    //MARKS: OUTLETS
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonDefense: UILabel!
    @IBOutlet weak var pokedexID: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonBaseAttack: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonEvol1: UIImageView!
    @IBOutlet weak var pokemonEvol2: UIImageView!
    @IBOutlet weak var pokemonNextLVL: UILabel!
    
    // MARKS: ACTIONS
    
    @IBAction func navBackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonName.text = pokemon.name.capitalized
        
        let img = UIImage(named: ("pokemon.pokedexId"))
        
        pokemonImage.image = img
        pokemonEvol1.image = img 
        
        
        
        pokedexID.text = "\(pokemon.pokedexId)"
        pokemon.downloadPokemonDetail {
            
            // Doing somehting later
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        
        self.pokemonBaseAttack.text = self.pokemon.attack
        self.pokemonDefense.text = self.pokemon.defense
        self.pokemonDescription.text = self.pokemon.description
        self.pokemonWeight.text = self.pokemon.weight
        self.pokemonHeight.text = self.pokemon.height
        self.pokemonType.text = self.pokemon.type

        
        
        
    
        
    
    }

    
    

}
