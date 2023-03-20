//
//  BaseRouter.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 17.03.2023.
//

import Foundation

protocol BaseRouter {
    var path: String { get }
    var method: String { get }
    var queryParameter: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeader: [HttpHeader]? { get }
}

extension BaseRouter{
    
    private var userDefautsService: UserDefaultsService {UserDefaultsService()}
    
    var host: String {
        return "34.159.231.164"
    }
    var scheme: String {
        return "http"
    }
    
    func createURLRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryParameter
        guard let url = urlComponents.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = httpBody
        httpHeader?.forEach{ (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        if let token = userDefautsService.getBy(key: .token) {
            urlRequest.setValue("\(token)", forHTTPHeaderField: "Authorization")
            print(token)
        }
        return urlRequest
    }
}
