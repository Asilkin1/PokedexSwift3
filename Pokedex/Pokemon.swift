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
     var _description: String!
     var _type: String!
     var _defense:String!
     var _height: String!
     var _weight: String!
     var _attack: String!
     var _nextEvolution: String!
    
    
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
