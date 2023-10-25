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
    @Published var modelYearsString: [String] = []
    
    func fetchModelYear() {
        Service.fetchDataFromServer(modelYears, model: nil, makeId: nil, serieID: nil, selectedAPIType: SelectedAPITYpe.model) { [weak self]result in
            switch result {
            case .success(let dataList):
                self?.modelYears = dataList
                self?.modelYearsString = self?.modelYears.map{String($0)} ?? []
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
