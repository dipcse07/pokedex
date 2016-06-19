//
//  Pokemon.swift
//  pokedex
//
//  Created by MD.SAZID HASAN DIP on 6/17/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defence: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    
    
    var name:String{
        return _name
    }
    
    var pokedexId: Int{
        return _pokedexId
    }
    
    
    init (name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
    }
    
}