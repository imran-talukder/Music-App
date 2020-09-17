//
//  DataModel.swift
//  Music-App
//
//  Created by Appnap WS01 on 16/9/20.
//  Copyright © 2020 Appnap WS01. All rights reserved.
//

import UIKit

struct DataModel {
    var urlString: String
    var title: String
    var subTitle: String
    var color: UIColor
    var imageName: String
    var hideProgress: Bool
    var pro: Float
    
}



let urlList = [
                    "https://download.music.com.bd/Music/A/Arnob/Doob/04%20-%20Arnob%20-%20Ghor%20Bahir%20(music.com.bd).mp3",
                    "https://download.music.com.bd/Music/A/Arnob/Doob/04%20-%20Arnob%20-%20Ghor%20Bahir%20(music.com.bd).mp3",
                    "https://download.music.com.bd/Music/A/Arnob/Doob/04%20-%20Arnob%20-%20Ghor%20Bahir%20(music.com.bd).mp3",
                    "https://download.music.com.bd/Music/A/Arnob/Doob/04%20-%20Arnob%20-%20Ghor%20Bahir%20(music.com.bd).mp3",
                    "https://download.music.com.bd/Music/A/Arnob/Doob/04%20-%20Arnob%20-%20Ghor%20Bahir%20(music.com.bd).mp3",
                    "https://download.music.com.bd/Music/A/Arnob/Doob/04%20-%20Arnob%20-%20Ghor%20Bahir%20(music.com.bd).mp3"

            ]

var allData = [
      DataModel(urlString: urlList[0], title: "Linkin Park - Castle of Glass", subTitle: "Castle of Glass song", color: .red, imageName: "play", hideProgress: true, pro: 0.0),
      DataModel(urlString: urlList[1], title: "Linkin Park - Castle of Glass", subTitle: "Castle of Glass song", color: .red, imageName: "play", hideProgress: true, pro: 0.0),
      DataModel(urlString: urlList[2], title: "Linkin Park - Castle of Glass", subTitle: "Castle of Glass song", color: .red, imageName: "play", hideProgress: true, pro: 0.0),
      DataModel(urlString: urlList[3], title: "Linkin Park - Castle of Glass", subTitle: "Castle of Glass song", color: .red, imageName: "play", hideProgress: true, pro: 0.0),
      DataModel(urlString: urlList[4], title: "Linkin Park - Castle of Glass", subTitle: "Castle of Glass song", color: .red, imageName: "play", hideProgress: true, pro: 0.0),
      DataModel(urlString: urlList[5], title: "Linkin Park - Castle of Glass", subTitle: "Castle of Glass song", color: .red, imageName: "play", hideProgress: true, pro: 0.0)

]
