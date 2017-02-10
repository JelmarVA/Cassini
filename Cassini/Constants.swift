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
        "Earth": "https://www.nasa.gov/sites/default/files/thumbnails/image/187_1003703_africa_dxm.png",
        "Saturn": "https://www.nasa.gov/sites/default/files/images/394218main_PIA11667_full.jpg"
    ]
    
    static func NASAImageNamed(imageName: String?) -> URL? {
        if let urlstring = NASA[imageName ?? ""] {
            return URL(string: urlstring)
        }else {
            return nil
        }
    }
}
