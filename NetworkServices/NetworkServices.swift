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
enum Constants: String {
    case apiKey = "NTUzODIwZjQ1ODgyMTFhZGE3MjY4YzA5NTA5OGY5NjNjYmFmMmNiNGIxZGY0NzRjZTY3ZTVhNjU2ZDZlMjlmMQ"
    case baseURL = "https://api.kacasatar.com/public/api/vehicles/"
}

//MARK: Error Handling
public enum ErrorClasss: Error {
    case failedFetch
    case unknown
}

enum SelectedAPITYpe: String {
    case color = "color"
    case model = "models"
}

class Service {
    
    let shared = Service()
    
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
    
    private init() {
        
    }
}
