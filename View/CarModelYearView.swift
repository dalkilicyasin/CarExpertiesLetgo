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
                VStack{
                    Text("Please Select the model of year")
                        .foregroundStyle(.white).font(.largeTitle)
                    ScrollView{
                        VStack {
                            ForEach(viewModel.modelYears, id: \.self){ index in
                                    NavigationLink(destination: MakeScreenView(viewModel: MakeScreenViewModel(model:" \(index)"))){
                                        Text("\(index)")
                                            .font(.title)
                                            .background(Color.white)
                                            .padding(25)
                                    }
                            }
                        }
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
