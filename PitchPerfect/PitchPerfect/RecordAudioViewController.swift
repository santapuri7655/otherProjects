//
//  RecordAudioViewController.swift
//  PitchPerfect
//
//  Created by radhika santapuri on 8/29/18.
//  Copyright © 2018 radhika santapuri. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController, AVAudioRecorderDelegate {
    
    struct Constants {
        static let recording = "Recording..."
        static let recordedVoice = "recordedVoice.wav"
        static let tapToRecord = "Tap to Record"
        static let stopRecordingIdentifier = "StopRecording"
        static let recordingFailedMessage = "recording failed"
    }
    
    var audioRecorder: AVAudioRecorder?

    @IBOutlet weak var recordButton: UIButton?
    @IBOutlet weak var tapToRecord: UILabel?
    @IBOutlet weak var stopRecordingButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func pressRecord(_ sender: AnyObject) {
        tapToRecord?.text = Constants.recording
        recordButton?.isEnabled = false
        stopRecordingButton?.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        print(dirPath)
        let recordingName = Constants.recordedVoice
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder?.delegate = self
        audioRecorder?.isMeteringEnabled = true
        audioRecorder?.prepareToRecord()
        audioRecorder?.record()
    }
    
    @IBAction func pressStopRecording(_ sender: AnyObject) {
        tapToRecord?.text = Constants.tapToRecord
        recordButton?.isEnabled = true
        stopRecordingButton?.isEnabled = false
        
        audioRecorder?.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: Constants.stopRecordingIdentifier, sender: audioRecorder?.url)
        } else {
            print(Constants.recordingFailedMessage)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.stopRecordingIdentifier {
            let playSoundsVC = segue.destination as? PlaySoundsViewController
            let recordedAudioURL = sender as? URL
            playSoundsVC?.recordedAudioURL = recordedAudioURL
        }
    }
}

