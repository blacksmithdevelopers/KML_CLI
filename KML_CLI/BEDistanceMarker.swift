//
//  BEDistanceMarker.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation

internal struct BEDistanceMarker {
    private var BEDistanceMarkerName: String
    private var centerPoint: [Double]  // longitude = centerpoint[0] || latitude = centerpoint[1]
    private var radius: Double
    private var description: String
    private var magVariation: Double
    private var iconType: IconType
    private var withLabel: Bool
    private var withIcon: Bool
    
    internal init(BEDistanceMarkerName: String,
         centerPoint: [Double],
         radius: Double,
         description: String,
         magVariation: Double,
         iconType: IconType,
         withLabel: Bool,
         withIcon: Bool) {
        self.BEDistanceMarkerName = BEDistanceMarkerName
        self.centerPoint = centerPoint
        self.radius = radius
        self.description = description
        self.magVariation = magVariation
        self.iconType = iconType
        self.withLabel = withLabel
        self.withIcon = withIcon
    }
    
    internal func BEMarkerGenerator() -> String {
        let radiusCalculated = self.radius * (1/60)
        let magVariation = self.magVariation
        let XptDistanceMarker = ((radiusCalculated/cos(centerPoint[1] * Double.pi / 180)) * cos((360 + magVariation) * Double.pi / 180)) + centerPoint[0]
        let YptDistanceMarker = (radiusCalculated * sin((360 + magVariation) * Double.pi / 180)) + centerPoint[1]
        let bullsEyeDistanceLabel = PlacemarkKML(placeMarkTitle: self.BEDistanceMarkerName, placeMarkDescription: self.description, placeMarkCoords: [XptDistanceMarker, YptDistanceMarker], iconType: self.iconType, withLabel: self.withLabel, withIcon: self.withIcon).iconGenerator()
        return bullsEyeDistanceLabel
    }
}

