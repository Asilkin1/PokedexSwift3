//
//  Pokemon.swift
//  Pokedex
//
//  Created by Alexander Silkin on 1/30/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import Foundation

class Pokemon {

     var _name: String!
     var _pokedexId: Int!
    
     var name: String {
        
        return _name
        
    }
    
    var pokedexId: Int {
        
        return _pokedexId
        
    }
    
    
    init(name:String, pokedexId:Int) {
    
            self._name = name
            self._pokedexId = pokedexId
    
    }
    
    

}
