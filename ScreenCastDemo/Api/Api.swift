//
//  Api.swift
//  ScreenCastDemo
//
//  Created by Neil Garcia on 26/3/21.
//

import Foundation
import Moya
import Alamofire
import Moya_ObjectMapper
import RxSwift
import ObjectMapper


private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

let apiProvider = MoyaProvider<Api>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter), logOptions: .verbose))])

// Enum the methods of the REST API
enum Api {
    case episodes
}

extension Api: TargetType {
    /// Base URL
    public var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }

    /// Returns the path for each endpoing of the API
    public var path: String {
        switch self {
        case .episodes:
            return "/api/episodes.json"
        }
    }

    /// Set Methods for each endpoint
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        
        }
    }
    /// Task type, usually a request.
    public var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }

    /// Return sample data for each WS for Unit Testing
    public var sampleData: Data {
        return "Half measures are as bad as nothing at all.".utf8Encoded
    }

    /// Parameter enconding.
//    public var parameterEncoding: Moya.ParameterEncoding {
//        switch self {
//        case .active:
//            return URLEncoding.default
//        default:
//            return JSONEncoding.default
//        }
//    }

    /// headers for the request
    public var headers: [String: String]? {
        return ["api-token": "adkanlnanda923"]
    }

}

/**
 Returns the base URL with the route path of the target
 
 - parameter route: Route of the target
 
 - returns: Complete url with host / target
 */
public func url(_ route: TargetType) -> String {
    //Migration
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

