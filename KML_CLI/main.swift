//
//  main.swift
//  KML_CLI
//
//  Created by Matthew Elmore on 7/30/18.
//  Copyright © 2018 Matthew Elmore. All rights reserved.
//

import Foundation



//let orangePM = PlacemarkKML(placeMarkTitle: "New", placeMarkDescription: "", placeMarkCoords: [-122, 39]).iconGenerator(iconStyle: .orangeCircle, styleId: "new", withLabel: true)

let coords: [Double] = [-122, 39]

let alt = 500.0
let coords01: [[Double]] = [[-120, 42, alt],[-119, 42, alt],[-119,41, alt],[-119, 42, alt]]

let c2 = [[-118.85236, 35.032969999999999, alt], [-119.65495, 34.452820000000003, alt], [-117.76699000000001, 34.564369999999997, alt], [-117.39328999999999, 35.669649999999997, alt]]


let magVar: Double = -13.0

let u = Utilities()






let newBE = BullsEyeKML(bullsEyeName: "TrythisShitOut",
                        centerPoint: coords,
                        radiusOfOuterRing: 150,
                        magVariation: -13.0,
                        lineColor: .red).BEKmlGenerator()

let kml = OpenCloseKML(kmlItems: newBE).KMLGenerator().writeToDocuments(fileName: "SDF", ext: "kml")





























