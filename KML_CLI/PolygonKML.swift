//
//  PolygonKML.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation

public struct PolygonKML {
    private var name: String
    private var description: String
    private var extrude: Extrude
    private var tessellate: Tessellate
    private var altMode: AltitudeMode
    private var coords: [[Double]]
    private var lineColor: ColorKML
    private var lineOpacity: Transparency
    private var polyColor: ColorKML
    private var polyOpacity: Transparency
    private var width: Int
    
    public init(name: String,
                description: String,
                extrude: Extrude,
                tesselate: Tessellate,
                altMode: AltitudeMode,
                coords: [[Double]],
                lineColor: ColorKML,
                lineOpacity: Transparency,
                polyColor: ColorKML,
                polyOpacity: Transparency,
                width: Int) {
        self.name = name
        self.description = description
        self.extrude = extrude
        self.tessellate = tesselate
        self.altMode = altMode
        self.coords = coords
        self.lineColor = lineColor
        self.lineOpacity = lineOpacity
        self.polyColor = polyColor
        self.polyOpacity = polyOpacity
        self.width = width
    }
    
    public func lineGenerator() -> String {
        let lineStyle = StyleKML(name: self.name,
                                 lineColor: self.lineColor,
                                 lineOpacity: self.lineOpacity,
                                 polyColor: self.polyColor,
                                 polyOpacity: self.polyOpacity,
                                 width: self.width).styleGenerator()
        var points = ""
        for coordPair in self.coords {
            let lat = coordPair[0]
            let long = coordPair[1]
            let alt = coordPair[2]
            let coordString = "\(lat), \(long),\(alt)\r"
            points += coordString
        }
        let polygon: String = """
        \(lineStyle)
        <Placemark>
            <name>\(self.name)</name>
            <description>\(description)</description>
            <styleUrl>#\(self.name)</styleUrl>
            <LineString>
                <extrude>\(self.extrude.rawValue)</extrude>
                <tessellate>\(self.tessellate.rawValue)</tessellate>
                <altitudeMode>\(self.altMode.rawValue)</altitudeMode>
                <coordinates>\(points)\r</coordinates>
            </LineString>
        </Placemark>
        """
        return polygon
    }
    
    public func filledInPolygon() -> String {
        let lineStyle = StyleKML(name: self.name,
                                 lineColor: self.lineColor,
                                 lineOpacity: self.lineOpacity,
                                 polyColor: self.polyColor,
                                 polyOpacity: self.polyOpacity,
                                 width: self.width).styleGenerator()
        var points = ""
        let numberOfPoints = self.coords.count
        var counter = 0
        for coordPair in self.coords {
            let long = coordPair[1]
            let lat = coordPair[0]
            let alt = coordPair[2]
            let coordString = "\(lat), \(long),\(alt)\r"
            points += coordString
            counter += 1
            if counter == numberOfPoints {
                let lastLat = self.coords[0][0]
                let lastLong = self.coords[0][1]
                let lastAlt = self.coords[0][2]
                let lastCoordString = "\(lastLat), \(lastLong),\(lastAlt)\r"
                points += lastCoordString
            }
        }
        let polygon: String = """
        \(lineStyle)
        <Placemark>
            <name>\(self.name)</name>
            <styleUrl>#\(self.name)</styleUrl>
            <Polygon>
                <extrude>\(self.extrude.rawValue)</extrude>
                <altitudeMode>\(self.altMode.rawValue)</altitudeMode>
                <outerBoundaryIs>
                    <LinearRing>
                        <coordinates>\(points)\r</coordinates>
                    </LinearRing>
                </outerBoundaryIs>
            </Polygon>
        </Placemark>
        """
        return polygon
    }
    
}































