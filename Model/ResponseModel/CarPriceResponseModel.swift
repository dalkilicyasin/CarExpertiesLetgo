//
//  CarPriceResponseModel.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
public struct CarPriceResponseModel: Decodable, Identifiable {
    public let id: Int?
    public let price: Int?
    public let code: String?
    public let random_id: String?
    public let transmission: OtherInfo?
    public let engine: OtherInfo?
}
