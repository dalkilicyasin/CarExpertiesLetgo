//
//  CarModelScreenViewModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import Foundation
import Combine
import SwiftUI

class CarModelYearScreenViewModel : ObservableObject{
    @Published var color = LinearGradient(colors: [Color.red, Color.black], startPoint: .leading, endPoint: .trailing)
    @Published var modelList: [GetCarModelResponse] = []
    @Published var modelYears: [Int] = []
    @Published var goDetail = false
    
    func fetch() {
        Service.fetchCarData(model: nil, makeId: nil, serieID: nil, selectedAPIType: SelectedAPITYpe.model) { [weak self] result in
            switch result {
            case .success(let dataList):
                self?.modelList = dataList
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchModelYear() {
        Service.fetchCarDataModelYear(model: nil, makeId: nil, serieID: nil, selectedAPIType: SelectedAPITYpe.model) { [weak self]result in
            switch result {
            case .success(let dataList):
                self?.modelYears = dataList
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}
