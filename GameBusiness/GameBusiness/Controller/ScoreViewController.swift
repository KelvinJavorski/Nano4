//
//  ScoreViewController.swift
//  GameBusiness
//
//  Created by Saulo de Freitas Martins da Silva on 27/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ScoreViewController: UIViewController, GADRewardedAdDelegate {

    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var doublePointsButton: UIButton!
    @IBOutlet weak var nextLevelButton: UIButton!
    
    // Variável que define a tranformação de pontos em estrelas
    let pontosParaCadaEstrela : Int16 = 15
    
    /// The rewarded video ad.
    var rewardedAd: GADRewardedAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Atualiza a cutódia monetária do usuário
        Model.shared.acumulatedPoints += Model.shared.points
        
        arredondaBotoes()
        refreshLabels()
        rewardedAd = createAndLoadRewardedAd()
    }
    
    func refreshLabels(){
        refreshMoney()
        refreshStars()
    }
    
    func refreshMoney(){
        moneyLabel.text = "💰 " + String(Model.shared.points)
    }
    
    func refreshStars(){
        var pontos : Int16 = Model.shared.points
        
        if pontos > pontosParaCadaEstrela * 5 {
            starsLabel.text = "⭐️⭐️⭐️⭐️⭐️"
        } else {
            starsLabel.text = ""
            for _ in 0..<5 {
                if pontos >= pontosParaCadaEstrela {
                    starsLabel.text = String(starsLabel.text!) + "⭐️"
                    pontos -= pontosParaCadaEstrela
                }
            }
        }
        
    }
    
    func arredondaBotoes() {
        
        homeButton.clipsToBounds = true
        playAgainButton.clipsToBounds = true
        doublePointsButton.clipsToBounds = true
        nextLevelButton.clipsToBounds = true
        
        homeButton.layer.cornerRadius = homeButton.frame.size.height/3
        playAgainButton.layer.cornerRadius = playAgainButton.frame.size.height/3
        doublePointsButton.layer.cornerRadius = doublePointsButton.frame.size.height/3
        nextLevelButton.layer.cornerRadius = nextLevelButton.frame.size.height/3
    }
    
    @IBAction func rewardedAdAction(_ sender: Any) {

        if rewardedAd?.isReady == true {
           rewardedAd?.present(fromRootViewController: self, delegate:self)
        } else {
            print("Error while presenting rewarded ad.")
        }
    }
    

    func createAndLoadRewardedAd() -> GADRewardedAd? {
      rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3788964205286449/7828905169")
      rewardedAd?.load(GADRequest()) { error in
        if let error = error {
          print("Loading failed: \(error)")
        } else {
          print("Loading Succeeded")
        }
      }
      return rewardedAd
    }
    
    /// Tells the delegate that the user earned a reward.
    func rewardedAd(_ rewardedAd: GADRewardedAd, userDidEarn reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
        // Atualiza a cutódia monetária do usuário. Ele já recebe metade quando a tela carrega.
        Model.shared.acumulatedPoints += Model.shared.points
    }
    /// Tells the delegate that the rewarded ad was presented.
    func rewardedAdDidPresent(_ rewardedAd: GADRewardedAd) {
      print("Rewarded ad presented.")
    }
    /// Tells the delegate that the rewarded ad was dismissed.
    func rewardedAdDidDismiss(_ rewardedAd: GADRewardedAd) {
        print("Ad dismissed")
    }
    /// Tells the delegate that the rewarded ad failed to present.
    func rewardedAd(_ rewardedAd: GADRewardedAd, didFailToPresentWithError error: Error) {
      print("Rewarded ad failed to present.")
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
