//
//  EnterKMScreenViewModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
//

import Foundation
import Combine
import SwiftUI

class EnterKMScreenViewModel : ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var getPriceResponse: CarPriceResponseModel = CarPriceResponseModel(id: nil, price: nil, code: nil, random_id: nil, transmission: nil, engine: nil)
    @Published var getKMValue = ""
    @Published var isPresented = false
    @Published var showIndicator = false
    @Published var colorCar = ""
    @Published var model = ""
    @Published var makeId = ""
    @Published var bodyType = ""
    @Published var transmissionType = ""
    @Published var trim = ""
    @Published var trimID = 0
    @Published var colorID = 0
    
    init(makeId: String,
         model: String,
         bodyType: String,
         transmissionType: String,
         trim: String,
         trimID: Int,
         colorID: Int,
         colorCar: String) {
        
        self.makeId = makeId
        self.model = model
        self.bodyType = bodyType
        self.transmissionType = transmissionType
        self.trim = trim
        self.trimID = trimID
        self.colorID = colorID
        self.colorCar = colorCar
    }

    func fetch() {
        let model = (self.model as NSString).integerValue
        let kMValue = (self.getKMValue as NSString).integerValue
        let experties = "{\"ceiling\":\"original\",\"front_hood\":\"modified\",\"rear_hood\":\"original\",\"front_left_mudguard\": \"original\",\"front_right_mudguard\":\"original\",\"rear_left_mudguard\":\"original\",\"front_left_door\":\"original\", \"front_right_door\":\"painted\",\"rear_left_door\":\"original\",\"rear_right_door\":\"original\",\"rear_right_mudguard\":\"original\"}"
        let getCarPriceRequestModel = GetCarPriceRequestModel(trim_id: trimID, model: model, kilometerage: kMValue, color_id: 16, expertise: experties)
        Service.fetchExpertiesData(parameter: getCarPriceRequestModel) { [weak self] result in
            switch result {
            case .success(let dataList):
                self?.getPriceResponse = dataList
                self?.isPresented.toggle()
                self?.showIndicator = false
            case .failure(let error):
                print(error.localizedDescription)
                self?.showIndicator = false
            }
        }
    }
}
