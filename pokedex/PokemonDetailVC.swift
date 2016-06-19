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
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)

    }


}
