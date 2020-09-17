//
//  ViewController.swift
//  Music-App
//
//  Created by Appnap WS01 on 16/9/20.
//  Copyright © 2020 Appnap WS01. All rights reserved.
//

import UIKit
import AVFoundation

var lastIndex = 0
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var playMusic: AVPlayer?
    var playerItem: AVPlayerItem!
    var playerItemContext = 0
    let requiredAssetKeys = [ "playable","hasProtectedContent"]
    
    
    var timer = Timer()
    var passedTime: Float = 0.0
    var totalTime: Float = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "customCellTableViewCell", bundle: nil), forCellReuseIdentifier: "tableCell")
        self.tableView.separatorStyle = .none
        playMusic = AVPlayer(url: URL(string: "abc")!)

    }


}

//MARK: - Table View Methods

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! customCellTableViewCell
       

        let item = allData[indexPath.row]
        
        cell.title.text = item.title
        cell.subTitle.text = item.subTitle
        cell.title.textColor = item.color
        cell.subTitle.textColor = item.color
        cell.imageShow.image = UIImage(systemName: item.imageName)
        cell.title.alpha = 0.7
        cell.subTitle.alpha = 0.5
        if item.hideProgress == false {
            cell.progressBar.progress = item.pro
        }
        cell.progressBar.isHidden = item.hideProgress
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        timer.invalidate()
        playMusic?.pause()
        passedTime = 0.0;
        if allData[indexPath.row].imageName == "play" {
            
            //playNow(urlString: allData[indexPath.row].urlString)
            allData[indexPath.row].color = .white
            allData[indexPath.row].imageName = "pause"
            allData[indexPath.row].hideProgress = false
            allData[indexPath.row].pro = 0.0
            loadRadio(radioURL: allData[indexPath.row].urlString)
            
        } else {
            allData[lastIndex].color = .red
            allData[lastIndex].imageName = "play"
            allData[indexPath.row].hideProgress = true
        }
        
        if lastIndex != indexPath.row {
            allData[lastIndex].color = .red
            allData[lastIndex].imageName = "play"
            allData[lastIndex].hideProgress = true
        }
        lastIndex = indexPath.row
        
        tableView.reloadData()
    }
    
    
//    func playNow(urlString: String) {
//        let url = URL(string: urlString)!
//        let asset = AVAsset(url: url)
//        let playerItem = AVPlayerItem(asset: asset)
//        playMusic?.replaceCurrentItem(with: playerItem)
//        playMusic?.play()
//    }
    
    
    //MARK: - Playing Radio
    
    func loadRadio(radioURL: String) {
            guard let url = URL.init(string: radioURL) else { return }
            let asset = AVAsset(url: url)
            
            let duration = asset.duration
            let durationInSeconds = CMTimeGetSeconds(duration)
            //print("Thime duration of the audio song is: \(durationInSeconds)")
            progressshow(time: Float(durationInSeconds))
        
            playerItem = AVPlayerItem(asset: asset,
                                      automaticallyLoadedAssetKeys: requiredAssetKeys)
            playerItem.addObserver(self,
                                   forKeyPath: #keyPath(AVPlayerItem.status),
                                   options: [.old, .new],
                                   context: &playerItemContext)
            playMusic = AVPlayer(playerItem: playerItem)
        
        
            // player!.automaticallyWaitsToMinimizeStalling = false
        
    }
    override func observeValue(forKeyPath keyPath: String?,of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &playerItemContext else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        if keyPath == #keyPath(AVPlayerItem.status) {
            let status: AVPlayerItem.Status
            if let statusNumber = change?[.newKey] as? NSNumber {
                status = AVPlayerItem.Status(rawValue: statusNumber.intValue)!
            } else {
                status = .unknown
            }
            // Switch over status value
            switch status {
            case .readyToPlay:
                playMusic?.automaticallyWaitsToMinimizeStalling = false
                
                
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(sender:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
                
                
                playMusic!.play() // here play remote sound
                print("playing.....")
                
            case .failed:
                
                print("Failed.....")
                break
            case .unknown:
                break
            @unknown default:
                break
            }
        }
    }
    
    @objc func playerDidFinishPlaying(sender: Notification) {
        print("Ses hoise vai....")
        allData[lastIndex].color = .red
        allData[lastIndex].imageName = "play"
        allData[lastIndex].hideProgress = true
        allData[lastIndex].pro = 0.0
        playMusic?.pause()
        timer.invalidate()
        tableView.reloadData()
        
        
    }
    
    //MARK: - Timer for progressbar
    
    func progressshow(time: Float) {
        allData[lastIndex].pro = 0.0
        totalTime = time
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        allData[lastIndex].hideProgress = true
        tableView.reloadData()
    }
    
    @objc func updateTimer() {
        passedTime += 1.0
        if passedTime < totalTime {
            allData[lastIndex].pro = passedTime / totalTime
        }
        
        tableView.reloadData()
    }
    
    //MARK: - Ended
}

//extension ViewController: AVAudioPlayerDelegate {
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        print("Finished Playing Bro!")
//    }
//}
