//
//  GetCarModelRequest.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import Foundation

struct GetCarPriceRequestModel: Encodable {
    let trim_id: Int?
    let model: Int?
    let kilometerage: Int?
    let color_id: Int?
    let expertise: String?
}
