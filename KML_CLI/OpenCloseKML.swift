//
//  OpenCloseKML.swift
//  KML
//
//  Created by elmo on 6/4/18.
//  Copyright © 2018 elmo. All rights reserved.
//

import Foundation


public struct OpenCloseKML {
    
    private var openingKML: String = """
                                    <?xml version=\"1.0\" encoding=\"UTF-8\"?>
                                        <kml xmlns=\"http://www.opengis.net/kml/2.2\">
                                            <Document>
                                    """
    private var closingKML: String = """
                                        </Document>
                                    </kml>
                                    """
    private var kmlItems: String
    
    
    public init(kmlItems: String) {
        self.kmlItems = kmlItems
    }
    public func KMLGenerator() -> String {
        let openingKML = self.openingKML
        let closingKML = self.closingKML
        let kmlItems = self.kmlItems
        let KML: String = "\(openingKML)\(kmlItems)\(closingKML)"
        return KML
    }
}
