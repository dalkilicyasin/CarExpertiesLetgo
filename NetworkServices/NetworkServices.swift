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

//MARK: Selected API Type
public enum SelectedAPITYpe: String {
    case color = "vehicles/colors"
    case model = "vehicles/models"
}

//MARK: Singleton Call API Services
class Service: ObservableObject {
    static let shared = Service()
    var getCarResponseList : [GetCarModelResponse]?
    let headers : HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(Constants.apiKey.rawValue)"]
    
    private init() {}
    
//MARK: - Get Request
    static func fetchDataFromServer<T: Decodable>(_ selectedType: [T], model: String?, makeId: String?, serieID: String?, selectedAPIType: SelectedAPITYpe?, complation: @escaping (Result<[T], ErrorClasss>) -> Void) {
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
        let request = AF.request(url, method: .get, parameters: nil, headers: Service.shared.headers)
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([T].self, from: data)
                    complation(.success(jsonData))
                } catch {
                    complation(.failure(ErrorClasss.failedFetch))
                }
            case .failure(_):
                print("error")
            }
        }
    }
    
//MARK: - Post Request
    static func fetchExpertiesData(parameter: GetCarPriceRequestModel, complation: @escaping (Result<CarPriceResponseModel, ErrorClasss>) -> ()) {
        let urlString = "\(Constants.baseURL.rawValue)pricings"
       
        let request = AF.request(urlString , method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers:  Service.shared.headers)
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
}
