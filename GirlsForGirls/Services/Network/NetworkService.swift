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
                    
                    self.tryAgain { [weak self] response in
                        var newRequest = urlRequest
                        guard let newToken = UserDefaultsService.shared.getBy(key: .token) as? String else { return }
                        newRequest.setValue("Bearer \(newToken)", forHTTPHeaderField: "Authorization")
                        switch response {
                        case .success:
                            self?.sendRequest(urlRequest: newRequest, successModel: successModel, completion: {
                                response in
                                DispatchQueue.main.async {
                                    switch response {
                                    case .success(let model):
                                        completion(.success(model))
                                    case .badRequest(let model):
                                        completion(.badRequest(model))
                                    case .failure(let model):
                                        completion(.failure(model))
                                    case .unauthorized:
                                        completion(.unauthorized("Токен опять умер("))
                                    }
                                }
                            })
                        case .failure:
                            completion(.failure("Упс failure"))
                        }
                    }
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
    
    // MARK: - New accessToken
    func tryAgain(completion: @escaping (TryAgainResult) -> ()) {
        let userDefaultsService = UserDefaultsService()
        
        guard let refreshToken = userDefaultsService.getBy(key: .refresh) as? String else { return }
        let data  = [
            "refresh" : refreshToken
        ]
        let body = data.toData()
//        print(TokenController.postToken(body: body).createURLRequest(accept: "application/json", isContentTypeIncluded: true, isAccessTokenRequired: false))
        sendRequest(
            urlRequest: LoginRouter.refreshToken(data: body).createURLRequest(accept: "application/json", isContentTypeIncluded: true, isAccessTokenRequired: false),
            successModel: AccesTokenModel.self
        ) { result in
            switch result {
            case .success(let model):
                userDefaultsService.save(value: model.access, key: .token)
                completion(.success)
            case .badRequest(_):
                completion(.failure)
            case .unauthorized:
                completion(.failure)
            case .failure(_):
                completion(.failure)
            }
        }
    }
}

fileprivate extension Encodable {
    func toData() -> Data {
        (try? JSONEncoder().encode(self)) ?? Data()
    }
}
