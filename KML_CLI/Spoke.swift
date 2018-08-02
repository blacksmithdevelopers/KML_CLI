//
//  Spoke.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation



internal struct Spoke {
    private var name: String = ""
    private var description: String = ""
    private var extrude: Extrude = .on
    private var tessellate: Tessellate = .on
    private var altMode: AltitudeMode = .relativeToGround
    private var styleName: String
    private var radius: Double
    private var centerPoint: [Double]   // longitude = centerpoint[0] || latitude = centerpoint[1]
    private var degreesFromNinety: Double
    private var magVariation: Double
    
    
    internal init(styleName: String,
         radius: Double,
         centerPoint: [Double],
         degreesFromNinety: Double,
         magVariation: Double) {
        self.styleName = styleName
        self.radius = radius
        self.centerPoint = centerPoint
        self.degreesFromNinety = degreesFromNinety
        self.magVariation = magVariation
    }
    
    internal func inverseDegreesFromNinety() -> Double {
        var inverse = self.degreesFromNinety
        if inverse > 180 {
            inverse = inverse - 180
        } else {
            inverse = inverse + 180
        }
        return inverse
    }
    
    internal func spokeGenerator() -> String {
        let styleName = self.styleName
        let radiusCalculated = self.radius * (1/60)
        let magVariation = self.magVariation
        
        let Xpt_1 = ((radiusCalculated/cos(centerPoint[1] * Double.pi / 180)) * cos((degreesFromNinety + magVariation) * Double.pi / 180)) + centerPoint[0]
        let Ypt_1 = (radiusCalculated * sin((degreesFromNinety + magVariation) * Double.pi / 180)) + centerPoint[1]
        let Xpt_2 = ((radiusCalculated/cos(centerPoint[1] * Double.pi / 180)) * cos((inverseDegreesFromNinety() + magVariation) * Double.pi / 180)) + centerPoint[0]
        let Ypt_2 = (radiusCalculated * sin((inverseDegreesFromNinety() + magVariation) * Double.pi / 180)) + centerPoint[1]
        
        let point_1 = "\(Xpt_1),\(Ypt_1),0"
        let centerPoint_ = "\(centerPoint[0]),\(centerPoint[1]),0"
        let point_2 = "\(Xpt_2),\(Ypt_2),0"
        
        let spoke: String = """
        <Placemark>
            <name>\(name)</name>
            <description>\(description)</description>
            <styleUrl>#\(styleName)</styleUrl>
            <LineString>
                <extrude>\(self.extrude.rawValue)</extrude>
                <tessellate>\(self.tessellate.rawValue)</tessellate>
                <altitudeMode>\(self.altMode.rawValue)</altitudeMode>
                <coordinates>\(point_1)\r\(centerPoint_)\r\(point_2)\r</coordinates>
            </LineString>
        </Placemark>
        """
        //print(spoke)
        return spoke
    }
    
}
