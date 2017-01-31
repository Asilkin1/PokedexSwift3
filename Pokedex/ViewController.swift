//
//  ViewController.swift
//  Pokedex
//
//  Created by Alexander Silkin on 1/30/17.
//  Copyright © 2017 Alexander Silkin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var pokemon = [Pokemon]()
    var musicPlayer:AVAudioPlayer!
    
    
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    @IBAction func musicButtonPressed(_ sender: UIButton) {
        
        if musicPlayer.isPlaying {
            
            musicPlayer.pause()
            sender.alpha = 0.2
            
        } else {
        
            musicPlayer.play()
            sender.alpha = 1.0
        
        }
        
        
    }
    
    func initAudio() {
    
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        
        do {
            
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError {
        
            print(err.debugDescription)
            
            
        }
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        pokemonParser()
        initAudio()
        
        
    }
    
    func pokemonParser() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv" )
        
        do {
        
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            print(rows)
            
            for row in rows {
            
                let pokemonId = Int(row["id"]!)!
                let pokemonName = row["identifier"]!
                let poke = Pokemon(name: pokemonName, pokedexId: pokemonId)
                
                pokemon.append(poke)
                
                
            }
        
        } catch let err as NSError {
        
            print(err.debugDescription)
        }
        
    
    }
    
    //Deque the cell and sets it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell",for: indexPath) as? PokeCell {
            
            
            let poke = pokemon[indexPath.row]
            cell.configureCell(poke)
            
            
            return cell
        
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    // When we tap the cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    // Number of items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    // Number of sections in the view
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    

   


}

