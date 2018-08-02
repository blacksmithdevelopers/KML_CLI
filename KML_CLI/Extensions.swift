//
//  Extensions.swift
//  KML_CLI
//
//  Created by Matthew Elmore on 8/2/18.
//  Copyright © 2018 Matthew Elmore. All rights reserved.
//

import Foundation

extension String {
    public func writeToDocuments(fileName: String, ext: String) {
        let filenameWithExt = "\(fileName).\(ext)"
        let urlName = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!.appendingPathComponent("02_KML/\(filenameWithExt)")
        let myData = Data(self.utf8)
        do {
            try myData.write(to: urlName, options: .atomic)
        } catch {
            print(error)
        }
    }
}
