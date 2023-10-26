//
//  ColorScreenViewModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
//

import Foundation
import Combine
import SwiftUI

class ColorScreenViewModel: ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var colorList: [GetCarModelResponse] = []
    @Published var trimID: Int = 0
    var colorCar = ""
    var model = ""
    var makeId = ""
    var serieId = ""
    var bodyType = ""
    var transmissionType = ""
    var trim = ""

    init(makeId: String, 
         model: String,
         serieId: String,
         bodyType: String,
         transmissionType: String,
         trim: String) {
        
        self.makeId = makeId
        self.model = model
        self.serieId = serieId
        self.bodyType = bodyType
        self.transmissionType = transmissionType
        self.trim = trim
    }
    
    func fetch() {
        //Fetching SeriesList
        Service.fetchDataFromServer(colorList, model: nil, makeId: nil, serieID: nil, selectedAPIType: SelectedAPITYpe.color) { [weak self] result in
            switch result {
            case .success(let dataList):
                self?.colorList = dataList
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func filterTrim() {
        var carModel = Service.shared.getCarResponseList
        carModel = carModel?.filter({ $0.name == self.trim})

        guard carModel?.isEmpty == false else {return}
        
        trimID = carModel?[0].id ?? 0
    }
}
