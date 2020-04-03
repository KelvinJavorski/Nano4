//
//  MenuViewController.swift
//  GameBusiness
//
//  Created by Saulo de Freitas Martins da Silva on 18/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import AVFoundation

class MenuViewController: UIViewController {

    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var jogarButton: UIButton!
    @IBOutlet weak var apoiarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arredondaBotoes()
        refreshMoney()
        setupMusic()
    }
    
    func refreshMoney(){
        moneyLabel.text = "💰 " + String(Model.shared.acumulatedPoints)
    }
    
    func arredondaBotoes() {
        
        jogarButton.clipsToBounds = true
        apoiarButton.clipsToBounds = true
        
        jogarButton.layer.cornerRadius = jogarButton.frame.size.height/3
        apoiarButton.layer.cornerRadius = apoiarButton.frame.size.height/3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "ShowModalView" {
                // Evento do Firebase Analystics: Clicando no botão Jogar.
                Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
                AnalyticsParameterContentType: "botao_play_menu"])
            }
        }
    }
    
    func setupMusic(){
        let sound = Bundle.main.path(forResource: "Neon_Storm", ofType: "mp3")
        do {
            Model.shared.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
    }

    @IBAction func playMusic(_ sender: Any) {
    }

}
