//
//  TransmissonTypeViewModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import Foundation
import Combine
import SwiftUI

class TransmissonTypeViewModel : ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var modelList: [GetCarModelResponse] = []
    @Published var transmissionList: [String] = []
    var model = ""
    var makeId = ""
    var serieId = ""
    var bodyType = ""
    var engineType = ""
    
    init(makeId: String, 
         model: String,
         serieId: String,
         bodyType: String,
         engineType: String) {
        
        self.makeId = makeId
        self.model = model
        self.serieId = serieId
        self.bodyType = bodyType
        self.engineType = engineType
        self.modelList = Service.shared.getCarResponseList ?? []
    }
    
    func filterTransmiisonList(){
        self.transmissionList = []
        for index in self.modelList {
            self.transmissionList.append(index.transmission?.name ?? "")
        }
        self.transmissionList = transmissionList.removeDuplicates()
    }
}
