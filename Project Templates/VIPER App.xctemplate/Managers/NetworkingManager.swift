//
//  NetworkingManager.swift
//  OrgTech
//
//  Created by Maksym Balukhtin on 22.04.2020.
//  Copyright © 2020 Maksym Balukhtin. All rights reserved.
//

import Foundation

protocol JSONEncodable: Codable {
  func toJSONData() -> Data?
}

@frozen enum DataTaskResult<ResultType: Codable> {
  case success(ResultType)
  case error(DataTaskError<ResultType>)
}

@frozen enum DataTaskError<DecodeType>: Error {
  case genericError(Error)
  case invalidURL(String)
  case invalidRequestBody(Decodable)
  case dataIsEmpty
  case cannotObtainData(Int)
  case invalidDecoding(Data, DecodeType)
  
  var localizedDescription: String {
    let headMsg = "Error:"
    var errMsg = ""
    
    switch self {
    case .genericError(let error):
      errMsg = error.localizedDescription
    case .invalidURL(let urlStr):
      errMsg = [urlStr, "cannot be convertet to URL"].joined(separator: " ")
    case .invalidRequestBody(let object):
      errMsg = "Cannot obtain correct data from: \(object)"
    case .dataIsEmpty:
      errMsg = "Request returned empty body"
    case .cannotObtainData(let status):
      errMsg = "Data cannot be obtained because of server status: \(status)"
    case .invalidDecoding(let data, let decodeType):
      errMsg = ["Unable to decode obtined data",
                String(data: data, encoding: .utf8) ?? "",
                "as \(type(of: decodeType))"]
        .joined(separator: " ")
    }
    
    return [headMsg, errMsg].joined(separator: " ")
  }
}

final class NetworkingManager {
  private var session: URLSession
  static let shared = NetworkingManager()
  
  init() {
    let configuration = URLSessionConfiguration.default
    session = URLSession(configuration: configuration)
  }
  
  func startGetTask<ObjectType: Codable>(forURL urlStr: String, object: ObjectType.Type, completion: @escaping (DataTaskResult<ObjectType>) -> Void) {
    guard let url = URL(string: urlStr) else {
      completion(.error(.invalidURL(urlStr)))
      return
    }
    
    session.dataTask(with: url) { data, response, error in
      if let response = response as? HTTPURLResponse, 400...600 ~= response.statusCode {
        dispatchMain {
          completion(.error(.cannotObtainData(response.statusCode)))
        }
        return
      }
      
      if let error = error, data == nil {
        dispatchMain {
          completion(.error(.genericError(error)))
        }
        return
      }
      
      guard let data = data else {
        dispatchMain {
          completion(.error(.dataIsEmpty))
        }
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let object = try decoder.decode(ObjectType.self, from: data)
        dispatchMain {
          completion(.success(object))
        }
      } catch {
        dispatchMain {
          completion(.error(.genericError(error)))
        }
      }
    }.resume()
  }
  
  func startPostTask<PostObjectType, ResponseObjectType>(forURL urlStr: String, postObject: PostObjectType, responseObject: ResponseObjectType.Type, completion: @escaping (DataTaskResult<ResponseObjectType>) -> Void) where PostObjectType: JSONEncodable, ResponseObjectType: Codable {
    guard let url = URL(string: urlStr) else {
      completion(.error(.invalidURL(urlStr)))
      return
    }
    
    guard let httpBody = postObject.toJSONData() else {
      completion(.error(.invalidRequestBody(postObject)))
      return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = httpBody
    
    session.dataTask(with: request) { data, response, error in
      if let response = response as? HTTPURLResponse, 400...600 ~= response.statusCode {
        dispatchMain {
          completion(.error(.cannotObtainData(response.statusCode)))
        }
        return
      }
      
      if let error = error, data == nil {
        dispatchMain {
          completion(.error(.genericError(error)))
        }
        return
      }
      
      guard let data = data else {
        dispatchMain {
          completion(.error(.dataIsEmpty))
        }
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let object = try decoder.decode(ResponseObjectType.self, from: data)
        dispatchMain {
          completion(.success(object))
        }
      } catch {
        dispatchMain {
          completion(.error(.genericError(error)))
        }
      }
    }.resume()
  }
  
  func downloadImage(forURL urlStr: String, completion: @escaping (DataTaskResult<Data>) -> ()) {
    guard let url = URL(string: [API.apiBase, urlStr].joined()) else {
      completion(.error(.invalidURL(urlStr)))
      return
    }
    session.dataTask(with: url) { data, response, error in
      if let response = response as? HTTPURLResponse, 400...600 ~= response.statusCode {
        dispatchMain {
          completion(.error(.cannotObtainData(response.statusCode)))
        }
        return
      }
      
      if let error = error, data == nil {
        dispatchMain {
          completion(.error(.genericError(error)))
        }
        return
      }
      
      guard let data = data else {
        dispatchMain {
          completion(.error(.dataIsEmpty))
        }
        return
      }
      
      dispatchMain {
        CacheManager.shared.cacheImage(data, byKey: urlStr)
        completion(.success(data))
      }
    }.resume()
  }
}

// MARK: - Push to main asyncronyously
fileprivate func dispatchMain(completion: @escaping () -> Void) {
  DispatchQueue.main.async {
    completion()
  }
}

// MARK: - Custom networking errors
enum NetworkError: Error {
  case invalidURL
  case dataIsEmpty
  case invalidBody
}
