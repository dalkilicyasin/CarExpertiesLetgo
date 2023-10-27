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
    @Published var trimList: [String] = []
    var model = ""
    var makeId = ""
    var serieId = ""
    var bodyType = ""
    var transmissionType = ""
    
    init(makeId: String, 
         model: String,
         serieId: String,
         bodyType: String,
         transmissionType: String) {
        
        self.makeId = makeId
        self.model = model
        self.serieId = serieId
        self.bodyType = bodyType
        self.transmissionType = transmissionType
        self.modelList = Service.shared.getCarResponseList ?? []
    }
    
    func filterModelList() {
        self.modelList = self.modelList.filter { $0.transmission?.name == transmissionType}
        Service.shared.getCarResponseList = self.modelList
    }
    
    func filterTrimList(){
        self.trimList = []
        for index in self.modelList {
            self.trimList.append(index.name ?? "")
        }
        self.trimList = trimList.removeDuplicates()
    }
}
