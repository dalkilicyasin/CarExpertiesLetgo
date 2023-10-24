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
    @Published var goDetail = false
    var model = "" // Burada  @EnvironmentObject kullanılabilirdi fakat her init edildiğinde boş string dönmesi için emin olmak istedim. 
    var makeId = ""
    
    init(makeId: String, model: String) {
        self.makeId = makeId
        self.model = model
    }
    
    func fetch() {
        Service.fetchCarData(model: model, makeId: makeId, serieID: nil, selectedAPIType: SelectedAPITYpe.model) { [weak self] result in
            switch result {
            case .success(let dataList):
                self?.modelList = dataList
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

