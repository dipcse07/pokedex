//
//  Pokemon.swift
//  pokedex
//
//  Created by MD.SAZID HASAN DIP on 6/17/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defence: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _evoTxt: String!
    private var _pokemonUrl:String!
    private var _nextEvolutionId:String!
    private var _nextEvoLvl:String!
    
    
    var description: String{
        if _description == nil{
            _description = ""
        }
        
        return _description
    }
    
    var type:String{
        
        if _type == nil{
            _type = ""
        }
        return _type
    }
    
    var defense :String{
        
        if _defence == nil {
            _defence = ""
        }
        return _defence
    }
    
    var height:String{
        if _height == nil{
            _height = ""
        }
        return _height
    }
    
    
    var weight:String{
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    var attack:String{
        
        if _attack == nil{
            _attack = ""
        }
        return _attack
    }
    
    var evoTxt:String{
        if _evoTxt == nil {
            _evoTxt = ""
        }
        return _evoTxt
    }
    var nextEvolutionId: String{
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var nextEvoLvl:String{
      
         
            if _nextEvoLvl == nil {
                _nextEvoLvl = ""
            }
        
            return _nextEvoLvl
        
    }
    
    var name:String{
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var pokedexId: Int{
   
        return _pokedexId
    }
    
    
    init (name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        
    }
    
    func downloadPokemonDetails(completed: DownloadComplete){
        let url = NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { response in
//            print(response.request)  // original URL request
//            print(response.response) // URL response
//            print(response.data)     // server data
   //    print(response.result.value)   // result of response serialization
            if let dict = response.result.value as? Dictionary<String,AnyObject>{
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                    
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                    
                }
                
                if let attack = dict["attack"] as? Int{
                    self._attack = "\(attack)"
                    
                }
                
                if let defence = dict["defense"] as? Int {
                    self._defence = "\(defence)"
                    
                }
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defence)
                
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0{
                    if let name = types[0]["name"]{
                        self._type = name.capitalizedString
                    }
                    if types.count > 1 {
                        
                        for var x = 1; x < types.count; x++ {
                            
                            if let name = types[x]["name"]{
                                
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                }else {
                    self._type = ""
                }
                print(self._type)
                
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"]{
                        
                        let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                        
                        Alamofire.request(.GET, nsurl).responseJSON
                        
                            {response in
                                if let descDict = response.result.value as? Dictionary<String, AnyObject>{
                                    if let description = descDict["description"] as? String {
                                        
                                        self._description = description
                                        print(self._description)
                                        
                                    }
                                }
                                
                              completed()
                        }
                        
                        }
                        
                    } else{
                        self._description = ""
                    }
             
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evolutions.count > 0{
                    
                    if let to = evolutions[0]["to"] as? String {
                        
                        //cant support mega pokemon right now but api still has mega data
                        
                        if to.rangeOfString("mega") == nil {
                             if let uri = evolutions[0]["resource_uri"] as? String{
                                
                                let newStr = uri.stringByReplacingOccurrencesOfString( "/api/v1/pokemon/", withString: "")
                                let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                                
                                self._nextEvolutionId = num
                                self._evoTxt = to
                                
                                if let lvl = evolutions[0]["level"] as? Int {
                                    self._nextEvoLvl = "\(lvl)"
                                    
                                    print(self._nextEvolutionId)
                                    print(self._evoTxt)
                                    print(self._nextEvoLvl)
                                }
                                
                            }
                            
                        }
                    }
                }
                
                
                }
                
                
            }
            

        
    }
        
}
