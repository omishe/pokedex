//
//  Pokemon.swift
//  Pokedex
//
//  Created by Omishe Hernandez on 02/05/26.
//

class Pokemon {
    
    private var _name:String!
    private var _pokedexId: Int!
    
    var name:String {
        return _name
    }
    
    var pokedexId:Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
}
