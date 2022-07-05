//
//  Constants.swift
//  Characters
//
//  Created by Christo Kumar on 05/07/22.
//

import Foundation
import UIKit

let screenSize = UIScreen.main.bounds.size

enum AppUrls {
    static let baseUrl = "https://rickandmortyapi.com/api/character/?page="
}

enum AppLabelText {
    static let statusText = "Status"
    static let specieText = "Species"
    static let typeText = "Type"
    static let genderText = "Gender"
    static let originText = "Origin"
    static let locationText = "Location"
}

enum AppDimensions {
    static let standardSpacing = 5.0
    static let cellImageMultiplier = 0.5
    static let cellCornerRadius = 10.0
    static let cellShadowRadius = 5.0
    
    static let detailBackgroundViewHeight = screenSize.height/3
    static let detailImageViewWidth = screenSize.width/2
    static let detailImageViewHeight = screenSize.width/2
    static let detailBottomOffset = -screenSize.width/3
    static let detailBottomPadding = -screenSize.width/3
    static let dataCardWidth = (screenSize.width * 10)/11
    
    static let detailBannerColorName = "BannerBackground"
    static let detailDataCardColorName = "DetailBackground"
    static let detailShadowRadius = 10.0
    static let detailLineWidth = 4.0
}

enum AppPlaceHolders {
    static let defaultName = "Not Available"
    static let defaultStatus = "Unknown"
    static let defaultSpecies = "Unknown"
    static let defaultType = "Unknown"
    static let defaultGender = "Unknown"
    static let defaultLocation = "Unknown"
    static let defaultImageUrl = "https://rickandmortyapi.com/api/character/avatar/17.jpeg"
    static let defaultEpisodeCount = 0
}
