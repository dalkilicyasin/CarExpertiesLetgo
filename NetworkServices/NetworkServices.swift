//
//  NetworkServices.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import Foundation
import Alamofire
import Combine

//MARK: BaseURL and user info for data fetch
public enum Constants: String {
    case apiKey = "NTUzODIwZjQ1ODgyMTFhZGE3MjY4YzA5NTA5OGY5NjNjYmFmMmNiNGIxZGY0NzRjZTY3ZTVhNjU2ZDZlMjlmMQ"
    case baseURL = "https://api.kacasatar.com/public/api/"
}

//MARK: Error Handling
public enum ErrorClasss: Error {
    case failedFetch
    case unknown
}

public enum SelectedAPITYpe: String {
    case color = "vehicles/colors"
    case model = "vehicles/models"
}

class Service: ObservableObject {
    static let shared = Service()
    var getCarResponseList : [GetCarModelResponse]?
    static func fetchCarData(model: String?, makeId: String?, serieID: String?, selectedAPIType: SelectedAPITYpe?, complation: @escaping (Result<[GetCarModelResponse], ErrorClasss>) -> Void) {
        var urlString = "\(Constants.baseURL.rawValue)\(selectedAPIType?.rawValue ?? SelectedAPITYpe.model.rawValue)"
        if let model {
            urlString.append("/\(model)/makes")
            if let makeId {
                urlString.append("/\(makeId)/series")
                if let serieID {
                    urlString.append("/\(serieID)/trims")
                }
            }
        }
        let url = URL(string: urlString)!
        let token = "NTUzODIwZjQ1ODgyMTFhZGE3MjY4YzA5NTA5OGY5NjNjYmFmMmNiNGIxZGY0NzRjZTY3ZTVhNjU2ZDZlMjlmMQ"
        let headers : HTTPHeaders = ["Authorization":"Bearer \(token)"]
        let request = AF.request(url, method: .get, parameters: nil, headers: headers)
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([GetCarModelResponse].self, from: data)
                    complation(.success(jsonData))
                } catch {
                    complation(.failure(ErrorClasss.failedFetch))
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    static  func fetchCarDataModelYear(model: String?, makeId: String?, serieID: String?, selectedAPIType: SelectedAPITYpe?, complation: @escaping (Result<[Int], ErrorClasss>) -> Void) {
        var urlString = "\(Constants.baseURL.rawValue)\(selectedAPIType?.rawValue ?? SelectedAPITYpe.model.rawValue)"
        if let model {
            urlString.append("/\(model)/makes")
            if let makeId {
                urlString.append("/\(makeId)/series")
                if let serieID {
                    urlString.append("/\(serieID)/trims")
                }
            }
        }
        let url = URL(string: urlString)!
        let token = "NTUzODIwZjQ1ODgyMTFhZGE3MjY4YzA5NTA5OGY5NjNjYmFmMmNiNGIxZGY0NzRjZTY3ZTVhNjU2ZDZlMjlmMQ"
        let headers : HTTPHeaders = ["Authorization":"Bearer \(token)"]
        let request = AF.request(url, method: .get, parameters: nil, headers: headers)
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([Int].self, from: data)
                    complation(.success(jsonData))
                } catch {
                    complation(.failure(ErrorClasss.failedFetch))
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
    static func fetchExpertiesData(parameter: GetCarPriceRequestModel, complation: @escaping (Result<CarPriceResponseModel, ErrorClasss>) -> ()) {
        var urlString = "\(Constants.baseURL.rawValue)pricings"
        let url = URL(string: urlString)!
        let token = "NTUzODIwZjQ1ODgyMTFhZGE3MjY4YzA5NTA5OGY5NjNjYmFmMmNiNGIxZGY0NzRjZTY3ZTVhNjU2ZDZlMjlmMQ"
        let headers : HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(token)"]
        let request = AF.request(urlString , method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: headers)
        request.responseData { response in
            switch response.result {
            case .success(let data):
                
                do {
                    print(response)
                    let jsonData = try JSONDecoder().decode(CarPriceResponseModel.self, from: data)
                    complation(.success(jsonData))
                } catch {
                    if let responseString = String(data: data, encoding: .utf8) {
                                print("responseString = \(responseString)")
                            } else {
                                print("unable to parse response as string")
                            }
                    complation(.failure(ErrorClasss.failedFetch))
                }
            case .failure(_):
                print("error")
            }
        }
    }
    private init() {
        
    }
}
