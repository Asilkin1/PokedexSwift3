//
//  Pokemon.swift
//  Pokedex
//
//  Created by Alexander Silkin on 1/30/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import Foundation
import Alamofire


class Pokemon {

     var _name: String!
     var _pokedexId: Int!
     var _description: String!
     var _type: String!
     var _defense:String!
     var _height: String!
     var _weight: String!
     var _attack: String!
     var _nextEvolution: String!
     var _pokemonURL: String!
    
    
    
     var name: String {
        
        return _name
        
    }
    
    var pokedexId: Int {
        
        return _pokedexId
        
    }
    
    
    init(name:String, pokedexId:Int) {
    
            self._name = name
            self._pokedexId = pokedexId
            self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    
    }
    
    func downloadPokemonDetail(completed: DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            print(response.result.value)
            
        }
        
    }
    
}
    
    


