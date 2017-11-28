//
//  PizzaLocations.swift
//  ChiPizzaLocations
//
//  Created by Steven Lipton on 11/3/17.
//  Copyright © 2017 Steven Lipton. All rights reserved.
//

import UIKit
import MapKit

enum PizzaType {
    case thin
    case deepDish
    case potPie
}

class PizzaAnnotation:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: PizzaType
    init(_ latitude:CLLocationDegrees,_ longitude:CLLocationDegrees,title:String,subtitle:String,type:PizzaType){
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}


class PizzaAnnotations: NSObject {
    var restaurants:[PizzaAnnotation]
    
    override init(){
       //build an array of pizza loactions literally
        restaurants = [PizzaAnnotation(41.892472,-87.62687676, title: "Pizzeria Uno", subtitle:"First Deep Dish Pizza", type: .deepDish)]
        restaurants += [PizzaAnnotation(41.8931164,-87.6267778, title: "Pizzeria Due", subtitle:"Second Uno Location", type: .deepDish)]
        restaurants += [PizzaAnnotation(41.8957338,-87.6229457, title: "Gino's East", subtitle:"Deep Dish if you can't cross Michigan Avenue", type: .deepDish)]
        restaurants += [PizzaAnnotation(41.9206924,-87.6375364, title: "Chicago Pizza and Oven Grinder", subtitle:"Pizza baked in a bowl", type: .potPie)]
         restaurants += [PizzaAnnotation(41.9217837,-87.6645778, title: "Pequods", subtitle:"Carmelized Crust Deep Dish", type: .deepDish)]
         restaurants += [PizzaAnnotation(42.0018732,-87.7258586 , title: "Lou Malnati's", subtitle:"Ex Uno's Manager goes solo", type: .deepDish)]
         restaurants += [PizzaAnnotation(41.8910953,-87.6597941 , title: "CoalFire", subtitle:"Coal fired thin pizza", type: .thin)]
         restaurants += [PizzaAnnotation(41.9105463,-87.6760223, title: "Piece", subtitle:"White, thin square pizza", type: .thin)]
         restaurants += [PizzaAnnotation(41.9633682,-87.6737948, title: "Spacca Napoli", subtitle:"Authentic Neopolitan pizza", type: .thin)]
    }
}
