//
//  EnginScreenViewModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import Foundation
import Combine
import SwiftUI

class EnginScreenViewModel : ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var modelList: [GetCarModelResponse] = []
    var model = ""
    var makeId = ""
    var serieId = ""
    var bodyType = ""
    
    init(makeId: String, model: String, serieId: String, bodyType: String) {
        self.makeId = makeId
        self.model = model
        self.serieId = serieId
        self.bodyType = bodyType
        self.modelList = Service.shared.getCarResponseList ?? []
    }
}
