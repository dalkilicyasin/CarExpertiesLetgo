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
    case experties = "{\"ceiling\":\"original\",\"front_hood\":\"modified\",\"rear_hood\":\"original\",\"front_left_mudguard\":\"original\",\"front_right_mudguard\":\"original\",\"rear_left_mudguard\":\"original\",\"front_left_door\":\"original\",\"front_right_door\":\"painted\",\"rear_left_door\":\"original\",\"rear_right_door\":\"original\",\"rear_right_mudguard\":\"original\"}"
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
    static  func fetchCarData(model: String?, makeId: String?, serieID: String?, selectedAPIType: SelectedAPITYpe?, complation: @escaping (Result<[GetCarModelResponse], ErrorClasss>) -> Void) {
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
    
    static func fetchExpertiesData(trim_id: Int, model: Int, kilometerage: Int, color_id: Int, complation: @escaping (Result<GetCarModelResponse, ErrorClasss>) -> ()) {
        var urlString = "\(Constants.baseURL.rawValue)/pricings"
        let url = URL(string: urlString)!
        
        var parameters: [String: Any] = ["trim_id": trim_id, "model": model, "kilometerage": kilometerage, "expertise": Constants.experties.rawValue]
        let token = "NTUzODIwZjQ1ODgyMTFhZGE3MjY4YzA5NTA5OGY5NjNjYmFmMmNiNGIxZGY0NzRjZTY3ZTVhNjU2ZDZlMjlmMQ"
        let headers : HTTPHeaders = ["Authorization":"Bearer \(token)"]
        let request = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
     
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(GetCarModelResponse.self, from: data)
                    complation(.success(jsonData))
                } catch {
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
