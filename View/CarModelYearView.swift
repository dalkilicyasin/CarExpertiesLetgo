//
//  ContentView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine

struct CarModelYearView: View {
    @ObservedObject var viewModel: CarModelYearScreenViewModel
    init(viewModel: CarModelYearScreenViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            ZStack{
                viewModel.color.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 50){
                    Spacer(minLength: 10)
                    Text("Please Select the model of year")
                        .foregroundStyle(.white).font(.caption2)
                        .multilineTextAlignment(.center)
                        
                    ScrollView{
                        VStack(alignment: .leading, spacing: 2) {
                            ForEach(viewModel.modelYears, id: \.self){ index in
                                NavigationLink(destination: MakeScreenView(viewModel: MakeScreenViewModel(model:" \(index)"))){
                                    Text("\(index)")
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                        .font(.largeTitle)
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .padding(10)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }.padding(20)
                    }
                }
            }.onAppear{
                viewModel.fetchModelYear()
            }
        }
    }
}

#Preview {
    CarModelYearView(viewModel: CarModelYearScreenViewModel())
}
