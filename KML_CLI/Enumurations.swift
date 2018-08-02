//
//  Enumurations.swift
//  KML_CLI
//
//  Created by Matthew Elmore on 7/30/18.
//  Copyright © 2018 Matthew Elmore. All rights reserved.
//

import Foundation

public enum IconType: String {
    case none = " "
    case yellowPin = "http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png"
    case bluePin = "http://maps.google.com/mapfiles/kml/pushpin/blue-pushpin.png"
    case greenPin = "http://maps.google.com/mapfiles/kml/pushpin/grn-pushpin.png"
    case lightBluePin = "http://maps.google.com/mapfiles/kml/pushpin/ltblu-pushpin.png"
    case pinkPin = "http://maps.google.com/mapfiles/kml/pushpin/pink-pushpin.png"
    case purplePin = "http://maps.google.com/mapfiles/kml/pushpin/purple-pushpin.png"
    case whitePin = "http://maps.google.com/mapfiles/kml/pushpin/wht-pushpin.png"
    case blueDiamond = "http://maps.google.com/mapfiles/kml/paddle/blu-diamond.png"
    case blueCircle = "http://maps.google.com/mapfiles/kml/paddle/blu-circle.png"
    case blueSquare = "http://maps.google.com/mapfiles/kml/shapes/placemark_square.png"
    case greenDiamond = "http://maps.google.com/mapfiles/kml/paddle/grn-diamond.png"
    case greenCircle = "http://maps.google.com/mapfiles/kml/paddle/grn-circle.png"
    case greenSquare = "http://maps.google.com/mapfiles/kml/paddle/grn-square.png"
    case lightBlueDiamond = "http://maps.google.com/mapfiles/kml/paddle/ltblu-diamond.png"
    case lightBlueCircle = "http://maps.google.com/mapfiles/kml/paddle/ltblu-circle.png"
    case lightBlueSquare = "http://maps.google.com/mapfiles/kml/paddle/ltblu-square.png"
    case pinkDiamond = "http://maps.google.com/mapfiles/kml/paddle/pink-diamond.png"
    case pinkCircle = "http://maps.google.com/mapfiles/kml/paddle/pink-circle.png"
    case pinkSquare = "http://maps.google.com/mapfiles/kml/paddle/pink-square.png"
    case yellowDiamond = "http://maps.google.com/mapfiles/kml/paddle/ylw-diamond.png"
    case yellowCircle = "http://maps.google.com/mapfiles/kml/paddle/ylw-circle.png"
    case yellowSquare = "http://maps.google.com/mapfiles/kml/paddle/ylw-square.png"
    case whiteDiamond = "http://maps.google.com/mapfiles/kml/paddle/wht-diamond.png"
    case whiteCircle = "http://maps.google.com/mapfiles/kml/paddle/wht-circle.png"
    case redDiamond = "http://maps.google.com/mapfiles/kml/paddle/red-diamond.png"
    case redCircle = "http://maps.google.com/mapfiles/kml/paddle/red-circle.png"
    case redSquare = "http://maps.google.com/mapfiles/kml/paddle/red-square.png"
    case purpleDiamond = "http://maps.google.com/mapfiles/kml/paddle/purple-diamond.png"
    case purpleCircle = "http://maps.google.com/mapfiles/kml/paddle/purple-circle.png"
    case purpleSquare = "http://maps.google.com/mapfiles/kml/paddle/purple-square.png"
    case openDiamond = "http://maps.google.com/mapfiles/kml/shapes/open-diamond.png"
    case targetBlue = "http://maps.google.com/mapfiles/kml/shapes/target.png"
    case blueTriangle = "http://maps.google.com/mapfiles/kml/shapes/triangle.png"
    case forbidden = "http://maps.google.com/mapfiles/kml/shapes/forbidden.png"
    case whiteSquare = "http://maps.google.com/mapfiles/kml/paddle/wht-square.png"
    case orangeCircle = ""
}

public enum ColorKML: String {
    case black = "000000"
    case red = "1400FF"
    case orange = "1478FF"
    case darkYellow = "14B4FF"
    case yellow = "14F0FF"
    case darkGreen = "147800"
    case lightGreen = "14F000"
    case darkBlue = "780014"
}

public enum Transparency: String {
    case _0 = "0"
    case _5 = "5"
    case _10 = "a"
    case _15 = "f"
    case _20 = "14"
    case _25 = "19"
    case _30 = "1e"
    case _35 = "23"
    case _40 = "28"
    case _45 = "2d"
    case _50 = "32"
    case _55 = "37"
    case _60 = "3c"
    case _65 = "41"
    case _70 = "46"
    case _75 = "4b"
    case _80 = "50"
    case _85 = "55"
    case _90 = "5a"
    case _95 = "5f"
    case _100 = "ff"
}

public enum Extrude: String {
    /*
     Boolean value. Specifies whether to connect the LinearRing to the ground. To extrude this geometry, the altitude mode must be either relativeToGround, relativeToSeaFloor, or absolute. Only the vertices of the LinearRing are extruded, not the center of the geometry. The vertices are extruded toward the center of the Earth's sphere.
     */
    case on = "1"
    case off = "0"
}

public enum Tessellate: String {
    /*
     Boolean value. Specifies whether to allow the LinearRing to follow the terrain. To enable tessellation, the value for <altitudeMode> must be clampToGround or clampToSeaFloor. Very large LinearRings should enable tessellation so that they follow the curvature of the earth (otherwise, they may go underground and be hidden).
    */
    case on = "1"
    case off = "0"
}

public enum AltitudeMode: String {
    /*
    Specifies how altitude components in the <coordinates> element are interpreted. Possible values are
    ** clampToGround - (default) Indicates to ignore an altitude specification (for example, in the <coordinates> tag).
     
    ** relativeToGround - Sets the altitude of the element relative to the actual ground elevation of a particular location. For example, if the ground elevation of a location is exactly at sea level and the altitude for a point is set to 9 meters, then the elevation for the icon of a point placemark elevation is 9 meters with this mode. However, if the same coordinate is set over a location where the ground elevation is 10 meters above sea level, then the elevation of the coordinate is 19 meters. A typical use of this mode is for placing telephone poles or a ski lift.
     
    ** absolute - Sets the altitude of the coordinate relative to sea level, regardless of the actual elevation of the terrain beneath the element. For example, if you set the altitude of a coordinate to 10 meters with an absolute altitude mode, the icon of a point placemark will appear to be at ground level if the terrain beneath is also 10 meters above sea level. If the terrain is 3 meters above sea level, the placemark will appear elevated above the terrain by 7 meters. A typical use of this mode is for aircraft placement.
 */
    case clampToGround = "clampToGround"
    case relativeToGround = "relativeToGround"
    case absolute = "absolute"
}




















