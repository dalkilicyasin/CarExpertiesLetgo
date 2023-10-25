//
//  GetCarModelResponse.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import Foundation

public struct GetCarModelYear: Decodable {
     public let positionSource: Int
    
    public init(from decoder: Decoder) throws {
        var values = try decoder.unkeyedContainer()
        self.positionSource = try values.decode(Int.self)
    }
}

public struct GetCarModelResponse: Decodable, Identifiable {  
    public let id: Int?
    public let name: String?
    public let code: String?
    public let displacement: String?
    public let body_config: OtherInfo?
    public let transmission: OtherInfo?
    public let engine: OtherInfo?
}



public struct OtherInfo: Decodable{
    public let id: Int?
    public let name: String?
}


