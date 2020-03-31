//
//  MenuViewController.swift
//  GameBusiness
//
//  Created by Saulo de Freitas Martins da Silva on 18/03/20.
//  Copyright © 2020 Kelvin Javorski Soares. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import GoogleMobileAds
import AVFoundation

class MenuViewController: UIViewController, GADInterstitialDelegate {

    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        interstitial = createAndLoadInterstitial()
        setupMusic()
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
    func createAndLoadInterstitial() -> GADInterstitial {
        // ca-app-pub-2334129422444825/8121186261
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
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
        Model.shared.audioPlayer.play()
    }

    @IBAction func showAd(_ sender: Any) {

        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        } else {
          print("Ad wasn't ready")
        }
    }
    
    /// Tells the delegate an ad request succeeded.
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
      print("interstitialDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
      print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
      print("interstitialWillPresentScreen")
    }

    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
      print("interstitialWillDismissScreen")
    }

    /// Tells the delegate the interstitial had been animated off the screen.
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
      interstitial = createAndLoadInterstitial()
    }

    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
      print("interstitialWillLeaveApplication")
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
