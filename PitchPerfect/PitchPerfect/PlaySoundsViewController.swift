//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by radhika santapuri on 8/31/18.
//  Copyright © 2018 radhika santapuri. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton?
    @IBOutlet weak var fastButton: UIButton?
    @IBOutlet weak var lowPitchButton: UIButton?
    @IBOutlet weak var highPitchButton: UIButton?
    @IBOutlet weak var reverbButton: UIButton?
    @IBOutlet weak var echoButton: UIButton?
    @IBOutlet weak var stopButton: UIButton?
    
    var recordedAudioURL: URL?
    var audioFile: AVAudioFile?
    var audioEngine:AVAudioEngine?
    var audioPlayerNode: AVAudioPlayerNode?
    var stopTimer: Timer?
    
    enum ButtonType: Int {
        case slow = 0, fast, lowPitch, highPitch, reverb, echo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slowButton?.imageView?.contentMode = .scaleAspectFit
        fastButton?.imageView?.contentMode = .scaleAspectFit
        lowPitchButton?.imageView?.contentMode = .scaleAspectFit
        highPitchButton?.imageView?.contentMode = .scaleAspectFit
        reverbButton?.imageView?.contentMode = .scaleAspectFit
        echoButton?.imageView?.contentMode = .scaleAspectFit
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundsButtonPressed(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .lowPitch:
            playSound(pitch: -1000)
        case .highPitch:
            playSound(pitch: 1000)
        case .reverb:
            playSound(reverb: true)
        case .echo:
            playSound(echo: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        stopAudio()
    }
}
