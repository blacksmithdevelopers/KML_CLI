//
//  CircleKML.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation

//Generates a Circle of KML to insert as an internal part of the OpenCloseKML Struct
public struct CircleKML {
    private var styleName: String = ""
    private var description: String = ""
    private var extrude: Extrude = .on
    private var tessellate: Tessellate = .on
    private var altMode: AltitudeMode = .relativeToGround
    private var radius: Double
    private var centerPoint: [Double] // longitude = centerpoint[0] || latitude = centerpoint[1]
    private var centerLabelTitle: String
    private var centerLabelDescription: String = ""
    private var lineColor: ColorKML = .black
    private var lineOpacity: Transparency = ._100
    private var polyColor: ColorKML = .black
    private var polyOpacity: Transparency = ._0
    private var width: Int = 4
    private var centerpointLabelIncluded: Bool = true
    private var iconType: IconType = .blueCircle
    private var iconIncluded: Bool = true
    
    
    public init(radius: Double,
                centerPoint: [Double],
                centerpointLabelTitle: String,
                lineColor: ColorKML,
                iconType: IconType,
                iconIncluded: Bool,
                centerpointLabelIncluded: Bool,
                width: Int) {
        self.radius = radius
        self.centerPoint = centerPoint
        self.centerLabelTitle = centerpointLabelTitle
        self.lineColor = lineColor
        self.iconType = iconType
        self.iconIncluded = iconIncluded
        self.centerpointLabelIncluded = centerpointLabelIncluded
        self.width = width
    }
    
    public init(styleName: String,
                description: String,
                extrude: Extrude,
                tessellate: Tessellate,
                altMode: AltitudeMode,
                radius: Double,
                centerPoint: [Double],
                centerpointLabelTitle: String,
                centerpointLabelDescription: String) {
        self.styleName = styleName
        self.description = description
        self.extrude = extrude
        self.tessellate = tessellate
        self.altMode = altMode
        self.radius = radius
        self.centerPoint = centerPoint
        self.centerLabelTitle = centerpointLabelTitle
        self.centerLabelDescription = centerpointLabelDescription
    }
    
    public init(styleName: String,
                description: String,
                extrude: Extrude,
                tessellate: Tessellate,
                altMode: AltitudeMode,
                radius: Double,
                centerPoint: [Double],
                centerpointLabelTitle: String,
                centerpointLabelDescription: String,
                lineColor: ColorKML,
                lineOpacity: Transparency,
                polyColor: ColorKML,
                polyOpacity: Transparency,
                width: Int) {
        self.styleName = styleName
        self.description = description
        self.extrude = extrude
        self.tessellate = tessellate
        self.altMode = altMode
        self.radius = radius
        self.centerPoint = centerPoint
        self.centerLabelTitle = centerpointLabelTitle
        self.centerLabelDescription = centerpointLabelDescription
        self.lineColor = lineColor
        self.lineOpacity = lineOpacity
        self.polyColor = polyColor
        self.polyOpacity = polyOpacity
        self.width = width
    }
    
    
    
    
    private func circleGenerator_() -> String {
        let styleName = self.centerLabelTitle
        let longitude = centerPoint[0]
        let lattitude = centerPoint[1]
        let radiusCalculated = self.radius * (1/60)
        var circleOrderedPairs: [String] = []
        var coordPairs: String = ""
        
        for i in 0 ..< 361 {
            let j = Double(i)
            let x = ((radiusCalculated/cos(lattitude * Double.pi / 180)) * cos(j * Double.pi / 180)) + longitude
            let y = (radiusCalculated * sin(j * Double.pi / 180)) + lattitude
            let Xcoord = String(x)
            let Ycoord = String(y)
            
            let coordinates = "\(Xcoord),\(Ycoord)"
            circleOrderedPairs.append(coordinates)
        }
        
        for pair in circleOrderedPairs {
            coordPairs += "\(pair),0\r"
        }
        
        let circleKML: String = """
        <Placemark>
            <name>\(String(radiusCalculated))</name>
            <description>\(description)</description>
            <styleUrl>#\(styleName)</styleUrl>
            <LineString>
                <extrude>\(self.extrude.rawValue)</extrude>
                <tessellate>\(self.tessellate.rawValue)</tessellate>
                <altitudeMode>\(self.altMode.rawValue)</altitudeMode>
                <coordinates>\(coordPairs)</coordinates>
            </LineString>
        </Placemark>
        """
        return (circleKML)
    }
    
    private func circleFilledInGenerator_() -> String {
        //this one should be used with a complete initilizer
        let styleName = self.centerLabelTitle
        let longitude = centerPoint[0]
        let lattitude = centerPoint[1]
        let radiusCalculated = self.radius * (1/60)
        var circleOrderedPairs: [String] = []
        var coordPairs: String = ""
        
        for i in 0 ..< 361 {
            let j = Double(i)
            let x = ((radiusCalculated/cos(lattitude * Double.pi / 180)) * cos(j * Double.pi / 180)) + longitude
            let y = (radiusCalculated * sin(j * Double.pi / 180)) + lattitude
            let Xcoord = String(x)
            let Ycoord = String(y)
            
            let coordinates = "\(Xcoord),\(Ycoord)"
            circleOrderedPairs.append(coordinates)
        }
        
        for pair in circleOrderedPairs {
            coordPairs += "\(pair),0\r"
        }
        
        let circleKML: String = """
        <Placemark>
            <name>\(String(radiusCalculated))</name>
            <styleUrl>#\(styleName)</styleUrl>
            <Polygon>
                <extrude>\(self.extrude.rawValue)</extrude>
                <altitudeMode>\(self.altMode.rawValue)</altitudeMode>
                <outerBoundaryIs>
                    <LinearRing>
                        <coordinates>\(coordPairs)\r</coordinates>
                    </LinearRing>
                </outerBoundaryIs>
            </Polygon>
        </Placemark>
        """
        return (circleKML)
    }
    
    private func circleGenerator() -> String {
        let styleName = self.styleName
        let longitude = centerPoint[0]
        let lattitude = centerPoint[1]
        let radiusCalculated = self.radius * (1/60)
        var circleOrderedPairs: [String] = []
        var coordPairs: String = ""
        
        for i in 0 ..< 361 {
            let j = Double(i)
            let x = ((radiusCalculated/cos(lattitude * Double.pi / 180)) * cos(j * Double.pi / 180)) + longitude
            let y = (radiusCalculated * sin(j * Double.pi / 180)) + lattitude
            let Xcoord = String(x)
            let Ycoord = String(y)
            
            let coordinates = "\(Xcoord),\(Ycoord)"
            circleOrderedPairs.append(coordinates)
        }
        
        for pair in circleOrderedPairs {
            coordPairs += "\(pair),0\r"
        }
        
        let circleKML: String = """
        <Placemark>
            <name>\(String(radiusCalculated))</name>
            <description>\(description)</description>
            <styleUrl>#\(styleName)</styleUrl>
            <LineString>
                <extrude>\(self.extrude.rawValue)</extrude>
                <tessellate>\(self.tessellate.rawValue)</tessellate>
                <altitudeMode>\(self.altMode.rawValue)</altitudeMode>
                <coordinates>\(coordPairs)</coordinates>
            </LineString>
        </Placemark>
        """
        return (circleKML)
    }
    
    private func circleFilledInGenerator() -> String {
        let styleName = self.styleName
        let longitude = centerPoint[0]
        let lattitude = centerPoint[1]
        let radiusCalculated = self.radius * (1/60)
        var circleOrderedPairs: [String] = []
        var coordPairs: String = ""
        
        for i in 0 ..< 361 {
            let j = Double(i)
            let x = ((radiusCalculated/cos(lattitude * Double.pi / 180)) * cos(j * Double.pi / 180)) + longitude
            let y = (radiusCalculated * sin(j * Double.pi / 180)) + lattitude
            let Xcoord = String(x)
            let Ycoord = String(y)
            
            let coordinates = "\(Xcoord),\(Ycoord)"
            circleOrderedPairs.append(coordinates)
        }
        
        for pair in circleOrderedPairs {
            coordPairs += "\(pair),0\r"
        }
        
        let circleKML: String = """
        <Placemark>
            <name>\(String(radiusCalculated))</name>
            <styleUrl>#\(styleName)</styleUrl>
            <Polygon>
                <extrude>\(self.extrude.rawValue)</extrude>
                <altitudeMode>\(self.altMode.rawValue)</altitudeMode>
                <outerBoundaryIs>
                    <LinearRing>
                        <coordinates>\(coordPairs)\r</coordinates>
                    </LinearRing>
                </outerBoundaryIs>
            </Polygon>
        </Placemark>
        """
        return (circleKML)
    }
    
    private func circleCenterLabelGenerator() -> String {
        let canterLabelKML: String = """
        <Placemark>
            <name>\(centerLabelTitle)</name>
            <description>\(centerLabelDescription)</description>
            <Point>
                <coordinates>\(centerPoint[0]),\(centerPoint[1]),0</coordinates>
            </Point>
        </Placemark>
        """
        return canterLabelKML
    }
    
    private func centerpointIconGenerator() -> String {
        let icon = PlacemarkKML(placeMarkTitle: self.centerLabelTitle,
                                placeMarkDescription: "",
                                placeMarkCoords: self.centerPoint,
                                iconType: self.iconType,
                                withLabel: self.centerpointLabelIncluded,
                                withIcon: iconIncluded).iconGenerator()
        return icon
    }
    
    private func styleGenerator() -> String {
        let style = StyleKML(name: self.centerLabelTitle,
                             lineColor: self.lineColor,
                             lineOpacity: self.lineOpacity,
                             polyColor: self.polyColor,
                             polyOpacity: self.polyOpacity,
                             width: self.width).styleGenerator()
        return style
    }
    
    public func circleWithCenterLabel_() -> String {
        let returnKML = "\(styleGenerator())\(centerpointIconGenerator())\(circleGenerator_()))"
//        let returnKML = "\(centerpointIconGenerator())"

        return returnKML
    }
    
    public func circleWithOutCenterLabel_() -> String {
        let returnKML = "\(styleGenerator())\(circleGenerator_())"
        return returnKML
    }
    
    
    public func circleFilledInWithCenterLabel_() -> String {
        let returnKML = "\(styleGenerator())\(circleFilledInGenerator_())\(centerpointIconGenerator())"
        return returnKML
    }
    
    public func circleFilledInWithOutCenterLabel_() -> String {
        let returnKML = "\(styleGenerator())\(circleFilledInGenerator_())"
        return returnKML
    }
    
    // TODO: Clean this up: have to go back and verify that changing this wont change the bullsEye
    public func circleWithCenterLabel() -> String {
        let returnKML = "\(circleGenerator())\(circleCenterLabelGenerator())"
        return returnKML
    }
    
    public func circleWithOutCenterLabel() -> String {
        let returnKML = "\(circleGenerator())"
        return returnKML
    }
    
    
    public func circleFilledInWithCenterLabel() -> String {
        let returnKML = "\(circleFilledInGenerator())\(circleCenterLabelGenerator())"
        return returnKML
    }
    
    public func circleFilledInWithOutCenterLabel() -> String {
        let returnKML = "\(circleFilledInGenerator())"
        return returnKML
    }
    
}














