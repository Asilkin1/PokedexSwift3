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
     var _nextEvolutionID: String!
     var _nextEvolutionLevel: String!
    
    
    
    var nextEvolution: String {
        
        if _nextEvolution == nil {
            
            _nextEvolution = " "
        }
        
        return _nextEvolution
        
    }
    
    
    var description: String {
        
        if _description == nil {
            
            _description = " "
        }
        
        return _description
        
    }
    
    var type: String {
        
        if _type == nil {
            
            _type = " "
        }
        
        return _type
        
    }
    
    var defense: String {
        
        if _defense == nil {
            
            _defense = " "
        }
        
        return _defense
        
    }

    
    var height: String {
        
        if _height == nil {
            
            _height = " "
        }
        
        return _height
        
    }
    
    var weight: String {
        
        if _weight == nil {
            
            _weight = " "
        }
        
        return _weight
        
    }
    
    var attack: String {
        
        if _attack == nil {
            
            _attack = " "
        }
        
        return _attack
        
    }
    
    var nextEvolution: String {
    
        if _nextEvolution == nil {
        
            _nextEvolution = " "
        }
        
        return _nextEvolution
    
    }
    
    
    
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
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String,AnyObject> {
            
                if let weight = dict["weight"] as? String {
                
                    self._weight = weight
                
                }
                
                if let height = dict["height"] as? String {
                
                    self._height = height
                
                }
                
                if let attack = dict["attack"] as? Int {
                
                    self._attack = "\(attack)"
                    
                    
                }
                
                if let defense = dict["defense"] as? Int {
                
                    self._defense = "\(defense)"
                
                }
                
                
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String,String>], types.count > 0 {
                
                    if let name = types[0]["name"] {
                    
                        self._type = name.capitalized
                        
                    }
                        
                    if types.count > 1 {
                        
                        for x in 1..<types.count {
                            
                            if let name = types[x]["name"] {
                            
                                self._type! += "/\(name.capitalized)"
                                
                            }
                        
                        }
                    
                    }
                        
                    print(self._type)
                    
                }
                    else {
                    
                        self._type = " "
                }
                
                if let descArray = dict["descriptions"] as? [Dictionary<String, String>], descArray.count > 0 {
                    
                    if let url = descArray[0]["resource_uri"] {
                        
                        let descURL = "\(URL_BASE)\(url)"
                    
                        Alamofire.request(descURL).responseJSON(completionHandler: { (response) in
                            if let descDict = response.result.value as?  Dictionary<String, AnyObject> {
                            
                                if let description = descDict["descriptions"] as? String {
                                    
                                    let newDesc = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    
                                    self._description = newDesc
                                    print(newDesc)
                                
                                }
                            }
                            
                            completed()
                        })
                    
                    }
                } else {
                
                    self._description = ""
                    
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
                
                    if let nextEvolution = evolutions[0]["to"] as? String {
                    
                        if nextEvolution.range(of: "mega") == nil {
                        
                            
                            self._
                        
                        }
                        
                    }
                
                }
            }
            
            completed()
            
        }
        
    }
    
}
    
    


