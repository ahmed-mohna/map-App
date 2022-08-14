//
//  Locations.swift
//  map App
//
//  Created by Ahmed Mohna on 04/08/2022.
//

import Foundation
import CoreLocation

struct Location:Identifiable,Equatable  {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id==rhs.id
        
    }
    
     let name: String
     let cityName: String
     let coordinates: CLLocationCoordinate2D
     let description:String
     let imageNames: [String]
     let link: String
     var  id : String {
       return name + cityName
    }

    
}
