//
//  MakeScreenViewMode.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import Foundation
import Combine
import SwiftUI

class MakeScreenViewModel : ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var modelList: [GetCarModelResponse] = []
    var model: String
    
    init(model: String) {
        self.model = model
    }
    //fetching modelList
    func fetch() {
        Service.fetchDataFromServer(modelList, model: model, makeId: nil, serieID: nil, selectedAPIType: SelectedAPITYpe.model) { [weak self] result in
            switch result {
            case .success(let dataList):
                self?.modelList = dataList
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

