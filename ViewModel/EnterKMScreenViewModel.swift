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
    @Published var getPriceResponse: GetCarModelResponse = GetCarModelResponse(id: nil, name: nil, code: nil, displacement: nil, body_config: nil, transmission: nil, engine: nil)

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
    }
    
    func fetch() {
        Service.fetchExpertiesData(trim_id: 18495, model: 2022, kilometerage: 9000, color_id: 16) { [weak self] result in
            switch result {
            case .success(let dataList):
                self?.getPriceResponse = dataList
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
