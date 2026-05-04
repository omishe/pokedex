//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Omishe Hernandez on 03/05/26.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
    }
    

}
