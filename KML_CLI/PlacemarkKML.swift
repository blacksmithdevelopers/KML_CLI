//
//  PlacemarkKML.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation




public struct PlacemarkKML {
    private var placeMarkTitle: String
    private var placeMarkDescription: String
    private var placeMarkCoords: [Double] // longitude = centerpoint[0] || latitude = centerpoint[1]
    private var iconType: IconType
    private var withLabel: Bool
    private var withIcon: Bool
    
    public init(placeMarkTitle: String,
                placeMarkDescription: String,
                placeMarkCoords: [Double],
                iconType: IconType,
                withLabel: Bool,
                withIcon: Bool) {
        self.placeMarkTitle = placeMarkTitle
        self.placeMarkDescription = placeMarkDescription
        self.placeMarkCoords = placeMarkCoords
        self.iconType = iconType
        self.withLabel = withLabel
        self.withIcon = withIcon
    }
    
    public func iconGenerator() -> String {
        var href = self.iconType.rawValue
        var colorTag = ""
        var name = ""
        var scale = ""
        if self.withIcon == true || self.iconType == .none {
            scale = "1.0"
        } else {
            scale = "0.1"
        }
        if self.iconType == .forbidden {
            colorTag = "<color>ff0000ff</color>"
        }
        if self.iconType == .redCircle {
            colorTag = "<color>ff0000ff</color>"
        }
        if self.iconType == .orangeCircle {
            colorTag = "<color>FF1478FF</color>"
            href = "http://maps.google.com/mapfiles/kml/paddle/ylw-circle.png"
        }
        if self.withLabel == true {
            name = "<name>\(self.placeMarkTitle)</name>"
        } else {
            name = ""
        }
        let icon = """
        <Style id="\(self.placeMarkTitle)|\(self.placeMarkTitle)">
            <IconStyle>
                \(colorTag)
                <scale>\(scale)</scale>
                <Icon>
                    <href>\(href)</href>
                </Icon>
            </IconStyle>
        </Style>
        
        <StyleMap id="\(self.placeMarkTitle)|\(self.placeMarkTitle)">
            <Pair>
                <key>normal</key>
                <styleUrl>#\(self.placeMarkTitle)|\(self.placeMarkTitle)</styleUrl>
            </Pair>
        </StyleMap>
        
        <Placemark>
            \(name)
            <styleUrl>#\(self.placeMarkTitle)|\(self.placeMarkTitle)</styleUrl>
            <Point>
            <gx:drawOrder>1</gx:drawOrder>
            <coordinates>\(self.placeMarkCoords[0]),\(self.placeMarkCoords[1]),0</coordinates>
            </Point>
        </Placemark>
        """
        return icon
    }
}
