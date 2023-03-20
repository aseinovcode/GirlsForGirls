//
//  NetworkService.swift
//  GirlsForGirls
//
//  Created by Zalkar Aseinov on 17.03.2023.
//

import Foundation

class NetworkService{
    
    private var urlSession: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        urlSession = session
    }
    
    func sendRequest<T: Codable>(
        urlRequest: URLRequest,
        successModel: T.Type,
        completion: @escaping (ProResult<T>) -> ()
    ) {
        urlSession.dataTask(with: urlRequest) {
            [weak self] data, response, error in
            guard let self = self else {
                debugPrint(#function, "Your View Class is dead!")
                return
            }
            if let error = self.validateResponse(data: data, response: response, error: error) {
                if case NetworkErrors.badRequest = error,
                    let model = self.transformFromJSON(data: data, objectType: FailureModel.self) {
                    completion(.badRequest(model))
                } else if case NetworkErrors.unauthorized = error {
                    completion(.unauthorized("Токен умер("))
                } else {
                    completion(.failure("Упс, что-то пошло не так)"))
                }
            } else if let successModel = self.transformFromJSON(data: data, objectType: T.self) {
                completion(.success(successModel))
            } else {
                debugPrint(#function, "Some supernatural things happened")
            }
        }.resume()
    }
    
    private func validateResponse(data: Data?, response: URLResponse?, error: Error?) -> Error? {
        if let err = error {return err}
        guard let httpResponse = response as? HTTPURLResponse else {
            return URLError(.badServerResponse)
        }
        switch httpResponse.statusCode {
        case StatusCode.badRequest.code:
            return NetworkErrors.badRequest
        case StatusCode.unauthorized.code:
            return NetworkErrors.unauthorized
        default:
            return nil
        }
    }
    
    private func transformFromJSON<T: Codable>(data: Data?, objectType: T.Type) -> T? {
        guard let data = data else {return nil}
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
}
