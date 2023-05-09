//
//  Poi.swift
//  Roma2024
//
//  Created by Edoardo Troianiello on 09/05/23.
//

import Foundation
import CoreLocation
import SwiftUI

struct Poi: Hashable , Identifiable {
    
    var id: Int
    var name: String
    var shortDescription: String
    var address : String
    var geoFencingRadius : Int
    var latitude : Double?
    var longitude :Double?
    var image : UIImage? = UIImage(systemName: "photo")

}
