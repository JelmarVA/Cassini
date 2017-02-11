//
//  Constants.swift
//  Cassini
//
//  Created by Jelmar Van Aert on 10/02/2017.
//  Copyright © 2017 Jelmar Van Aert. All rights reserved.
//

import Foundation

struct Constants {
    static let Stanford = "http://stanford.edu/about/images/intro_about.jpg"
    
    static let NASA = [
        "Cassini" : "https://www.nasa.gov/centers/jpl/images/content/91882main_craft1-browse.jpg",
        "Earth": "http://eoimages.gsfc.nasa.gov/images/imagerecords/78000/78314/VIIRS_3Feb2012_lrg.jpg",
        "Saturn": "https://apod.nasa.gov/apod/image/0412/saturn_malmerCassini_5m.jpg"
    ]
    
    static func NASAImageNamed(imageName: String?) -> NSURL? {
        if let urlstring = NASA[imageName ?? ""] {
            return NSURL(string: urlstring)
        }else {
            return nil
        }
    }
}
