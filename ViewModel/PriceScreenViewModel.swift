//
//  PriceScreenViewModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
//

import Foundation
import Combine
import SwiftUI

class PriceScreenViewModel : ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var colorList: [GetCarModelResponse] = []

    @Published var model = ""
    @Published var bodyType = ""
    @Published var transmissionType = ""
    @Published var trim = ""
    @Published var engineType = ""
    @Published var colorCar = ""
    @Published var km = ""
    @Published var price = 0
    
    init(model: String,
         bodyType: String,
         transmissionType: String,
         trim: String,
         engineType: String,
         colorCar: String,
         km: String,
         price: Int) {
        
        self.model = model
        self.bodyType = bodyType
        self.transmissionType = transmissionType
        self.trim = trim
        self.engineType = engineType
        self.price = price
        self.colorCar = colorCar
        self.km = km
    }
}
