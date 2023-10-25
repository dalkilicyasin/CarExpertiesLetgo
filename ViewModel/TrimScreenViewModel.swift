//
//  TrimScreenViewModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//
import Foundation
import Combine
import SwiftUI

class TrimScreenViewModel : ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var modelList: [GetCarModelResponse] = []
    @Published var goDetail = false
  
    var model = ""
    var makeId = ""
    var serieId = ""
    var bodyType = ""
    var transmissionType = ""
    var trim = ""
    
    init(makeId: String, model: String, serieId: String, bodyType: String, transmissionType: String, trim: String) {
        self.makeId = makeId
        self.model = model
        self.serieId = serieId
        self.bodyType = bodyType
        self.transmissionType = transmissionType
        self.trim = trim
        self.modelList = Service.shared.getCarResponseList ?? []
    }
}
