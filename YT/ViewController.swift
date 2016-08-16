//
//  ViewController.swift
//  YT
//
//  Created by Christopher Dugan on 4/3/15.
//  Copyright (c) 2015 Flyby. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var preview: UIImageView!
    @IBOutlet weak var player: YTPlayerView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var actInd : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setUpView()
    }

    func setUpView() {
        preview.image = UIImage(named: "bill-preview") //should load preview from cms
    }
    
    func runActivityIndicator() {
        actInd.hidesWhenStopped = true
        playButton.hidden = true
        actInd.startAnimating()
    }

    @IBAction func playVideo(sender: AnyObject) {
        runActivityIndicator()
        player.loadWithVideoId("N9XKLqGqwLA") //should be parse and load func
    }
    
    func playerViewDidBecomeReady(playerView: YTPlayerView!) {
        player.playVideo()
    }
    
    func playerView(playerView: YTPlayerView!, didChangeToState state: YTPlayerState) {
        switch state {
            case .Ended:
                NSLog("Ended Playback")
            case .Playing:
                NSLog("Started Playback")
                actInd.stopAnimating()
                playButton.hidden = false
            default:
                NSLog("Who CARES")
        }
    }
}

