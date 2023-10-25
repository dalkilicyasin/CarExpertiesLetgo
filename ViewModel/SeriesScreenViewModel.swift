//
//  SeriesScreenViewModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import Foundation
import Combine
import SwiftUI

class SeriesScreenViewModel : ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var modelList: [GetCarModelResponse] = []
    var model = "" 
    var makeId = ""
    var serieID = ""
    
    init(makeId: String, model: String, serieID:String) {
        self.makeId = makeId
        self.model = model
        self.serieID = serieID
    }
    
    func fetch() {
        //Fetching SeriesList
        Service.fetchDataFromServer(modelList, model: model, makeId: makeId, serieID: serieID, selectedAPIType: SelectedAPITYpe.model) { [weak self] result in
            switch result {
            case .success(let dataList):
                self?.modelList = dataList
                Service.shared.getCarResponseList = self?.modelList
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

