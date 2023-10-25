//
//  ContentView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//
//MARK: -  Car Model Years

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
                VStack(alignment: .center, spacing: 30){
                    Spacer(minLength: 10)
                    Text("Please Select the Model Year")
                        .foregroundStyle(.white).font(
                            .largeTitle
                            .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .padding(5)
                    ScrollView{
                        VStack(alignment: .leading, spacing: 2) {
                            ForEach(viewModel.modelYearsString, id: \.self){ index in
                                NavigationLink(destination: MakeScreenView(viewModel: MakeScreenViewModel(model:" \(String(index))"))){
                                    Text("\(index)")
                                        .font(
                                               .title
                                               .weight(.medium)
                                           )
                                           .foregroundColor(.blue)
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
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
