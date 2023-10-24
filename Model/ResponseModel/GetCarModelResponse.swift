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

public struct GetCarModelResponse: Decodable, Identifiable{
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


/*
 {
     "id": 5693,
     "name": "X-TRAIL 2.0 DCI LE 4x4 OV",
     "code": "x-trail-2.0-dci-le-4x4-ov",
     "displacement": "2",
     "body_config": {
       "id": 8,
       "name": "SUV"
     },
     "transmission": {
       "id": 2,
       "name": "Otomatik"
     },
     "engine": {
       "id": 2,
       "name": "Dizel"
     }
   },
 */
