//
//  EnterKMScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
//

import SwiftUI
import Combine
import Foundation

struct EnterKMScreenView: View {
    @ObservedObject var viewModel: EnterKMScreenViewModel
    init(viewModel: EnterKMScreenViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            viewModel.color.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                Spacer(minLength: 50)
                Text("Please Fill in the Millage Information")
                    .foregroundStyle(.white).font(
                        .largeTitle
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(10)
                    Spacer(minLength: 100)
                VStack {
                        enterKMView
                    Spacer(minLength: 300)
                        Button {
                            viewModel.showIndicator.toggle()
                            dissmissKeyboard()
                            viewModel.fetch()
                        } label: {
                            Text("Pricing")
                                .font(
                                    .title
                                        .weight(.medium)
                                   )
                                   .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                .background(Color.green)
                                .cornerRadius(10)
                                .padding(10)
                                .multilineTextAlignment(.center)
                        }.sheet(isPresented: $viewModel.isPresented) {
                            PriceScreenView(viewModel: PriceScreenViewModel(model: viewModel.model, bodyType: viewModel.bodyType, transmissionType: viewModel.getPriceResponse.transmission?.name ?? "", trim: viewModel.trim, engineType: viewModel.getPriceResponse.engine?.name ?? "", colorCar: viewModel.colorCar, km: viewModel.getKMValue, price: viewModel.getPriceResponse.price ?? 0))
                        }
                    Spacer(minLength: 50)
                    }
            }
            if viewModel.showIndicator {
                ProgressView()
                    .frame(minWidth: 0,maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .tint(.white)
                    .background(Color.gray.opacity(0.5))
                    .disabled(false)
            }
        }.onTapGesture {
            dissmissKeyboard()
        }
        .onChange(of: viewModel.isPresented) {
            if viewModel.isPresented {
                viewModel.showIndicator = false
            }
        }
    }
}

#Preview {
    EnterKMScreenView(viewModel: EnterKMScreenViewModel(makeId: "", model: "", bodyType: "", transmissionType: "", trim: "", trimID: 0, colorID: 0, colorCar: ""))
}


extension EnterKMScreenView {
    var enterKMView : some View {
        TextField("Km", text: $viewModel.getKMValue, prompt: Text("Km"))
            .font(.largeTitle)
            .padding()
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
    }
}
