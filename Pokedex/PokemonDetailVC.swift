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
    
    @IBOutlet weak var pokemonDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       pokemonDetails.text = pokemon.name
        
    }

    

}
