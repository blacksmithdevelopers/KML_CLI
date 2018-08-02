//
//  StyleKML.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation


//Generates Style KML code to insert as an internal part of the OpenCloseKML Struct
public struct StyleKML {
    
    private var name: String
    private var lineColor: ColorKML
    private var lineOpacity: Transparency
    private var polyColor: ColorKML
    private var polyOpacity: Transparency
    private var width: Int
    
    
    public init(name: String,
                lineColor: ColorKML,
                lineOpacity: Transparency,
                polyColor: ColorKML,
                polyOpacity: Transparency,
                width: Int) {
        self.name = name
        self.lineColor = lineColor
        self.lineOpacity = lineOpacity
        self.polyColor = polyColor
        self.polyOpacity = polyOpacity
        self.width = width
    }
    
    public func styleGenerator() -> String {
        let name = self.name
        let lineColor = self.lineColor
        let lineOpacity = self.lineOpacity
        let polyColor = self.polyColor
        let polyOpacity = self.polyOpacity
        let lineWidth = self.width
        
        let lineStyleColor = (lineOpacity.rawValue + lineColor.rawValue)
        let polyStyleColor = (polyOpacity.rawValue + polyColor.rawValue)
        let style: String = """
        <Style id=\"\(name)\">
            <LineStyle>
                <color>\(lineStyleColor)</color>
                <width>\(lineWidth)</width>
            </LineStyle>
            <PolyStyle>
                <color>\(polyStyleColor)</color>
            </PolyStyle>
        </Style>
        """
        return style
    }
    
}
