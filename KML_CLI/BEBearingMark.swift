//
//  BEBearingMark.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation


//BEBearingMark
internal struct BEBearingMark {
    private var description: String
    private var radius: Double
    private var centerPoint: [Double]
    private var degreesFromNinety: Int
    private var BEBearingMarkerName: String
    private var magVariation: Double
    private var iconType: IconType
    private var withLabel: Bool
    private var withIcon: Bool
    
    internal init(description: String,
         radius: Double,
         centerPoint: [Double],
         degreesFromNinety: Int,
         BEBearingMarkerName: String,
         magVariation: Double,
         iconType: IconType,
         withLabel: Bool,
         withIcon: Bool) {
        self.description = description
        self.radius = radius
        self.centerPoint = centerPoint
        self.degreesFromNinety = degreesFromNinety
        self.BEBearingMarkerName = BEBearingMarkerName
        self.magVariation = magVariation
        self.iconType = iconType
        self.withLabel = withLabel
        self.withIcon = withIcon
    }
 
    internal func BEBearingMarkerGenerator() -> String {
        let radiusCalculated = self.radius * (1/60)
        let magVariation = self.magVariation
        let XptBearingMarker = ((radiusCalculated/cos(centerPoint[1] * Double.pi / 180)) * cos((Double(self.degreesFromNinety) + magVariation) * Double.pi / 180)) + centerPoint[0]
        let YptBearingMarker = (radiusCalculated * sin((Double(self.degreesFromNinety) + magVariation) * Double.pi / 180)) + centerPoint[1]
        let bullsEyeBearingLabel: String = PlacemarkKML(placeMarkTitle: self.BEBearingMarkerName, placeMarkDescription: "", placeMarkCoords: [XptBearingMarker, YptBearingMarker], iconType: self.iconType, withLabel: self.withLabel, withIcon: self.withIcon).iconGenerator()
        return bullsEyeBearingLabel
    }
}

