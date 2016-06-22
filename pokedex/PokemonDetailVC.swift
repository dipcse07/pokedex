//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by MD.SAZID HASAN DIP on 6/19/16.
//  Copyright © 2016 MD.SAZID HASAN DIP. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    var pokemon: Pokemon!
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var defenceLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var pokedexIdLbl: UILabel!
    
    @IBOutlet weak var weightLbl: UILabel!
    
    @IBOutlet weak var BaseAttackLbl: UILabel!
    
    @IBOutlet weak var NextEvoLbl: UILabel!
    
    @IBOutlet weak var BeforEvoLbl: UIImageView!
    
    @IBOutlet weak var AfterEvoLbl: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        BeforEvoLbl.image = img
        
    pokemon.downloadPokemonDetails { 
        
       // print ("did we get here")   
        
    self.updateUI()
        }
        

        // Do any additional setup after loading the view.
    }
    func updateUI(){
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenceLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvolutionId == ""{
            NextEvoLbl.text = "NO EVOLUTION"
            AfterEvoLbl.hidden = true
        }
        else{
            AfterEvoLbl.hidden = false
            AfterEvoLbl.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.evoTxt)"
            if pokemon.nextEvoLvl != "" {
                str += " -LVL \(pokemon.nextEvoLvl)"
            }
            NextEvoLbl.text = str
        }
        //NextEvoLbl.text = pokemon.nextEvoLvl
        
        weightLbl.text = pokemon.weight
        BaseAttackLbl.text = pokemon.attack
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)

    }


}
