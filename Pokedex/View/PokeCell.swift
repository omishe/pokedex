//
//  PokeCell.swift
//  Pokedex
//
//  Created by Omishe Hernandez on 03/05/26.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage:UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon:Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        
        nameLbl.text = pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(pokemon.pokedexId)")
    }
    
}
