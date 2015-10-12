//
//  MarvelImage.swift
//  MarvelComicBrowser
//
//  Created by Deric Kramer on 9/30/15.
//  Copyright © 2015 ToolWatch. All rights reserved.
//

import Foundation
import ObjectMapper

enum ImageSizeEnum : CustomStringConvertible {  // Swift 2.0; for < 2.0 use Printable
    case Small
    case Medium
    case Large
    case XLarge
    case Fantastic
    case Amazing
    
    var description : String {
        switch self {
            // Use Internationalization, as appropriate.
        case .Small: return "standard_small"
        case .Medium: return "standard_medium"
        case .Large: return "standard_large"
        case .XLarge: return "standard_xlarge"
        case .Fantastic: return "portrait_fantastic"
        case .Amazing: return "standard_amazing"
        }
    }
}

struct MarvelImage : Mappable {
    var path: String?
    var fileExtension: String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        path            <- map["path"]
        fileExtension   <- map["extension"]
    }
    
    func fullPath(size: ImageSizeEnum) -> String? {
        if let p = self.path, f = self.fileExtension {
            return p + "/" + size.description + "." + f
        }
        return nil
    }
}
