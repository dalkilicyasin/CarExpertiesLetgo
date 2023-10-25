//
//  PriceView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
//

import SwiftUI
import Combine
import Foundation


struct PriceView: View {
    private let model: String?
    private let carName: String?
    private let engineType: String?
    private let transmissionType: String?
    private let colorCar: String?
    private let kilometer: String?
    private let carPrice: String?
    
    init(model: String?, 
         carName: String?,
         engineType: String?,
         transmissionType: String?,
         colorCar: String?,
         kilometer: String?,
         carPrice: String?) {
        
        self.model = model
        self.carName = carName
        self.engineType = engineType
        self.transmissionType = transmissionType
        self.colorCar = colorCar
        self.kilometer = kilometer
        self.carPrice = carPrice
    }
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                if let model{
                    Text("Model : \(model)")
                }
                
                if let carName{
                    Text("Car Name : \(carName)")
                }
                
                if let engineType{
                    Text("Engine Type : \(engineType)")
                }
                
                if let transmissionType{
                    Text("Transmission Type : \(transmissionType)")
                }
                
                if let colorCar{
                    Text("Car Color : \(colorCar)")
                }
                
                if let kilometer{
                    Text("KM : \(kilometer)")
                }
            }
            
            if let carPrice {
                VStack(spacing: 10){
                    Text("Market Price")
                        .font(.title)
                    Text("\(carPrice) TL")
                        .font(.title)
                }.frame(width: 200, height: 200)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(.green)
                    .padding(20)
            }
            
        }
    }
}


#Preview {
    PriceView(model: "Model", carName:"Trim" , engineType: "EngineType", transmissionType: "TransmissionType", colorCar: "Beyaz", kilometer: "120000", carPrice: "1200000")
}
