//
//  BEBearingMark.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation

public struct BullsEyeKML {
    //Fill in each time:
    private var bullsEyeName: String
    private var centerPoint: [Double]
    private var radiusOfOuterRing: Double
    private var magVariation: Double
    private var lineColor: ColorKML
    //Defaults
    private var centerpointLabel: Bool = true
    private var centerpointIcon: IconType = .targetBlue
    private var centerpointIconIncluded: Bool = true
    private var rangeLabels: Bool = true
    private var bearingLabels: Bool = true
    private var rangeIconsIncluded: Bool = false
    private var bearingIconsIncluded: Bool = false
    private var rangeBearingIconType: IconType = .bluePin
    private var lineThickness: Int = 4
    private var lineOpacity: Transparency = ._100
    private var polyColor: ColorKML = .orange
    private var polyOpacity: Transparency = ._0
    //Circle Stuff
    private var circleDescription: String = ""
    private var circleCenterpointLabelTitle: String = ""
    
    //Simple Init
    public init (bullsEyeName: String,
                      centerPoint: [Double],
                      radiusOfOuterRing: Double,
                      magVariation: Double,
                      lineColor: ColorKML) {
        self.bullsEyeName = bullsEyeName
        self.centerPoint = centerPoint
        self.radiusOfOuterRing = radiusOfOuterRing
        self.magVariation = magVariation
        self.lineColor = lineColor}
    
    //Partial Init
    public init (bullsEyeName: String,
                        centerPoint: [Double],
                        radiusOfOuterRing: Double,
                        magVariation: Double,
                        lineColor: ColorKML,
                        //Defaults
                        centerpointLabel: Bool,
                        rangeLabels: Bool,
                        bearingLabels: Bool,
                        centerpointIcon: IconType,
                        rangeBearingIconType: IconType,
                        centerpointIconIncluded: Bool,
                        rangeIconsIncluded: Bool,
                        bearingIconsIncluded: Bool) {
        self.bullsEyeName = bullsEyeName
        self.centerPoint = centerPoint
        self.radiusOfOuterRing = radiusOfOuterRing
        self.magVariation = magVariation
        self.lineColor = lineColor
        //Defaults
        self.centerpointLabel = centerpointLabel
        self.centerpointIcon = centerpointIcon
        self.centerpointIconIncluded = centerpointIconIncluded
        self.rangeLabels = rangeLabels
        self.rangeBearingIconType = rangeBearingIconType
        self.rangeIconsIncluded = rangeIconsIncluded
        self.bearingLabels = bearingLabels
        self.bearingIconsIncluded = bearingIconsIncluded }

    
    //Full Init
    public init (bullsEyeName: String,
                centerPoint: [Double],
                radiusOfOuterRing: Double,
                magVariation: Double,
                lineColor: ColorKML,
                //Defaults
                polyColor: ColorKML,
                lineThickness: Int,
                lineOpacity: Transparency,
                polyOpacity: Transparency,
                centerpointLabel: Bool,
                rangeLabels: Bool,
                bearingLabels: Bool,
                centerpointIcon: IconType,
                rangeBearingIconType: IconType,
                centerpointIconIncluded: Bool,
                rangeIconsIncluded: Bool,
                bearingIconsIncluded: Bool) {
        self.bullsEyeName = bullsEyeName
        self.centerPoint = centerPoint
        self.radiusOfOuterRing = radiusOfOuterRing
        self.magVariation = magVariation
        self.lineColor = lineColor
        //Defaults
        self.centerpointLabel = centerpointLabel
        self.centerpointIcon = centerpointIcon
        self.centerpointIconIncluded = centerpointIconIncluded
        self.rangeLabels = rangeLabels
        self.rangeBearingIconType = rangeBearingIconType
        self.rangeIconsIncluded = rangeIconsIncluded
        self.bearingLabels = bearingLabels
        self.bearingIconsIncluded = bearingIconsIncluded
        self.lineThickness = lineThickness
        self.lineOpacity = lineOpacity
        self.polyColor = polyColor
        self.polyOpacity = polyOpacity }
    
    public func BEKmlGenerator() -> String {
        let bullsEyeStyleName = "\(self.bullsEyeName)_"
        let BEStyle = StyleKML(name: bullsEyeStyleName,
                               lineColor: self.lineColor,
                               lineOpacity: self.lineOpacity,
                               polyColor: self.polyColor,
                               polyOpacity: self.polyOpacity,
                               width: self.lineThickness).styleGenerator()
        let BEName = PlacemarkKML(placeMarkTitle: self.bullsEyeName,
                                              placeMarkDescription: "",
                                              placeMarkCoords: self.centerPoint,
                                              iconType: self.centerpointIcon,
                                              withLabel: self.centerpointLabel,
                                              withIcon: self.centerpointIconIncluded).iconGenerator()
        
        let DM_01 = BEDistanceMarker(BEDistanceMarkerName: String(Int((radiusOfOuterRing/6)*2)),
                                                 centerPoint: self.centerPoint,
                                                 radius: (self.radiusOfOuterRing/6)*2,
                                                 description: "",
                                                 magVariation: self.magVariation,
                                                 iconType: self.rangeBearingIconType,
                                                 withLabel: self.rangeLabels,
                                                 withIcon: self.rangeIconsIncluded).BEMarkerGenerator()
        
        let DM_02 = BEDistanceMarker(BEDistanceMarkerName: String(Int((radiusOfOuterRing/6)*4)),
                                                 centerPoint: self.centerPoint,
                                                 radius: (self.radiusOfOuterRing/6)*4,
                                                 description: "",
                                                 magVariation: self.magVariation,
                                                 iconType: self.rangeBearingIconType,
                                                 withLabel: self.rangeLabels,
                                                 withIcon: self.rangeIconsIncluded).BEMarkerGenerator()
        var BE_01_Name = ""
        if rangeLabels == true && bearingLabels == true {
            BE_01_Name = "\(String(Int(radiusOfOuterRing)))-90°"
        }
        if rangeLabels == true && bearingLabels == false {
            BE_01_Name = "\(String(Int(radiusOfOuterRing)))NM"
        }
        if rangeLabels == false && bearingLabels == true {
            BE_01_Name = "90°"
        }
        let BE_01 = BEDistanceMarker(BEDistanceMarkerName: "\(BE_01_Name)",
            centerPoint: self.centerPoint,
            radius: self.radiusOfOuterRing,
            description: "",
            magVariation: self.magVariation,
            iconType: self.rangeBearingIconType,
            withLabel: self.bearingLabels,
            withIcon: self.bearingIconsIncluded).BEMarkerGenerator()
        
        let BE_02 = BEBearingMark(description: "",
                                             radius: self.radiusOfOuterRing,
                                             centerPoint: self.centerPoint,
                                             degreesFromNinety: 45,
                                             BEBearingMarkerName: "45°",
                                             magVariation: self.magVariation,
                                             iconType: self.rangeBearingIconType,
                                             withLabel: self.bearingLabels,
                                             withIcon: self.bearingIconsIncluded).BEBearingMarkerGenerator()
        let BE_03 = BEBearingMark(description: "",
                                             radius: self.radiusOfOuterRing,
                                             centerPoint: self.centerPoint,
                                             degreesFromNinety: 90,
                                             BEBearingMarkerName: "360°",
                                             magVariation: self.magVariation,
                                             iconType: self.rangeBearingIconType,
                                             withLabel: self.bearingLabels,
                                             withIcon: self.bearingIconsIncluded).BEBearingMarkerGenerator()
        let BE_04 = BEBearingMark(description: "",
                                             radius: self.radiusOfOuterRing,
                                             centerPoint: self.centerPoint,
                                             degreesFromNinety: 135,
                                             BEBearingMarkerName: "315°",
                                             magVariation: self.magVariation,
                                             iconType: self.rangeBearingIconType,
                                             withLabel: self.bearingLabels,
                                             withIcon: self.bearingIconsIncluded).BEBearingMarkerGenerator()
        let BE_05 = BEBearingMark(description: "",
                                             radius: self.radiusOfOuterRing,
                                             centerPoint: self.centerPoint,
                                             degreesFromNinety: 180,
                                             BEBearingMarkerName: "270°",
                                             magVariation: self.magVariation,
                                             iconType: self.rangeBearingIconType,
                                             withLabel: self.bearingLabels,
                                             withIcon: self.bearingIconsIncluded).BEBearingMarkerGenerator()
        let BE_06 = BEBearingMark(description: "",
                                             radius: self.radiusOfOuterRing,
                                             centerPoint: self.centerPoint,
                                             degreesFromNinety: 225,
                                             BEBearingMarkerName: "225°",
                                             magVariation: self.magVariation,
                                             iconType: self.rangeBearingIconType,
                                             withLabel: self.bearingLabels,
                                             withIcon: self.bearingIconsIncluded).BEBearingMarkerGenerator()
        let BE_07 = BEBearingMark(description: "",
                                             radius: self.radiusOfOuterRing,
                                             centerPoint: self.centerPoint,
                                             degreesFromNinety: 270,
                                             BEBearingMarkerName: "180°",
                                             magVariation: self.magVariation,
                                             iconType: self.rangeBearingIconType,
                                             withLabel: self.bearingLabels,
                                             withIcon: self.bearingIconsIncluded).BEBearingMarkerGenerator()
        let BE_08 = BEBearingMark(description: "",
                                             radius: self.radiusOfOuterRing,
                                             centerPoint: self.centerPoint,
                                             degreesFromNinety: 315,
                                             BEBearingMarkerName: "135°",
                                             magVariation: self.magVariation,
                                             iconType: self.rangeBearingIconType,
                                             withLabel: self.bearingLabels,
                                             withIcon: self.bearingIconsIncluded).BEBearingMarkerGenerator()
        let c1 = CircleKML(styleName: bullsEyeStyleName,
                           description: "",
                           extrude: .on,
                           tessellate: .on,
                           altMode: .relativeToGround,
                           radius: self.radiusOfOuterRing/6,
                           centerPoint: self.centerPoint,
                           centerpointLabelTitle: self.circleCenterpointLabelTitle,
                           centerpointLabelDescription: self.circleDescription).circleWithOutCenterLabel()
        let c2 = CircleKML(styleName: bullsEyeStyleName,
                           description: "",
                           extrude: .on,
                           tessellate: .on,
                           altMode: .relativeToGround,
                           radius: (self.radiusOfOuterRing/6)*2,
                           centerPoint: self.centerPoint,
                           centerpointLabelTitle: self.circleCenterpointLabelTitle,
                           centerpointLabelDescription: self.circleDescription).circleWithOutCenterLabel()
        let c3 = CircleKML(styleName: bullsEyeStyleName,
                           description: "",
                           extrude: .on,
                           tessellate: .on,
                           altMode: .relativeToGround,
                           radius: (self.radiusOfOuterRing/6)*3,
                           centerPoint: self.centerPoint,
                           centerpointLabelTitle: self.circleCenterpointLabelTitle,
                           centerpointLabelDescription: self.circleDescription).circleWithOutCenterLabel()
        let c4 = CircleKML(styleName: bullsEyeStyleName,
                           description: "",
                           extrude: .on,
                           tessellate: .on,
                           altMode: .relativeToGround,
                           radius: (self.radiusOfOuterRing/6)*4,
                           centerPoint: self.centerPoint,
                           centerpointLabelTitle: self.circleCenterpointLabelTitle,
                           centerpointLabelDescription: self.circleDescription).circleWithOutCenterLabel()
        let c5 = CircleKML(styleName: bullsEyeStyleName,
                           description: "",
                           extrude: .on,
                           tessellate: .on,
                           altMode: .relativeToGround,
                           radius: (self.radiusOfOuterRing/6)*5,
                           centerPoint: self.centerPoint,
                           centerpointLabelTitle: self.circleCenterpointLabelTitle,
                           centerpointLabelDescription: self.circleDescription).circleWithOutCenterLabel()
        let c6 = CircleKML(styleName: bullsEyeStyleName,
                           description: "",
                           extrude: .on,
                           tessellate: .on,
                           altMode: .relativeToGround,
                           radius: (self.radiusOfOuterRing/6)*6,
                           centerPoint: self.centerPoint,
                           centerpointLabelTitle: self.circleCenterpointLabelTitle,
                           centerpointLabelDescription: self.circleDescription).circleFilledInWithOutCenterLabel()
        let s1 = Spoke(styleName: bullsEyeStyleName,
                             radius: self.radiusOfOuterRing,
                             centerPoint: self.centerPoint,
                             degreesFromNinety: 0,
                             magVariation: self.magVariation).spokeGenerator()
        let s2 = Spoke(styleName: bullsEyeStyleName,
                             radius: self.radiusOfOuterRing,
                             centerPoint: self.centerPoint,
                             degreesFromNinety: 45,
                             magVariation: self.magVariation).spokeGenerator()
        let s3 = Spoke(styleName: bullsEyeStyleName,
                             radius: self.radiusOfOuterRing,
                             centerPoint: self.centerPoint,
                             degreesFromNinety: 90,
                             magVariation: self.magVariation).spokeGenerator()
        let s4 = Spoke(styleName: bullsEyeStyleName,
                             radius: self.radiusOfOuterRing,
                             centerPoint: self.centerPoint,
                             degreesFromNinety: 135,
                             magVariation: self.magVariation).spokeGenerator()
        var centerpointLabelKML = ""
        var rangeLabelKML = ""
        var bearingLabelKML = ""
        let restOfBEKML = "\(s1)\(s2)\(s3)\(s4)\(c1)\(c2)\(c3)\(c4)\(c5)\(c6)"
        if bearingLabels == true {
            bearingLabelKML = "\(BE_01)\(BE_02)\(BE_03)\(BE_04)\(BE_05)\(BE_06)\(BE_07)\(BE_08)"
        } else {
            bearingLabelKML = ""
        }
        if rangeLabels == true {
            rangeLabelKML = "\(DM_01)\(DM_02)\(BE_01)"
        } else {
            rangeLabelKML = ""
        }
        if centerpointLabel == true {
            centerpointLabelKML = "\(BEName)"
        } else {
            centerpointLabelKML = ""
        }
        let internalKML = "\(BEStyle)\(centerpointLabelKML)\(rangeLabelKML)\(bearingLabelKML)\(restOfBEKML)"
        
        return internalKML
    }
}
