//
//  PokeCell.swift
//  Pokedex
//
//  Created by Alexander Silkin on 1/30/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        nameLabel.text = self.pokemon.name.capitalized
        pokemonImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
}
