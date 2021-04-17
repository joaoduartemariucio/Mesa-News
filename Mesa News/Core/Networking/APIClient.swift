//
//  APIClient.swift
//  Mesa News
//
//  Created by João Vitor Duarte Mariucio on 17/04/21.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class APIClient {
    
    //    MARK: - Executador de requests
    static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                
                debugRequest(response: response)
                
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                    break
                case .failure(let error):
                    switch response.response?.statusCode {
                    case 200:
                        observer.onError(APIError.noDecoded)
                    case 204:
                        observer.onError(APIError.noContent)
                        break
                    case 400:
                        observer.onError(APIError.badRequest)
                        break
                    case 401:
                        observer.onError(APIError.unauthorized)
                        break
                    case 403:
                        observer.onError(APIError.forbidden)
                        break
                    case 404:
                        observer.onError(APIError.notFound)
                        break
                    case 405:
                        observer.onError(APIError.noAllowed)
                        break
                    case 409:
                        observer.onError(APIError.conflict)
                        break
                    case 500:
                        observer.onError(APIError.internalServerError)
                        break
                    default:
                        observer.onError(error)
                        break
                    }
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

// MARK: - Funções de apoio
func debugRequest<T>(response: AFDataResponse<T>){
    print("<========== INICIO PRINT RESPONSE")
    print("URL: ", response.request?.urlRequest ?? "nil")
    print("STATUS: ", response.response?.statusCode ?? 0)
    print("BODY: ", response.request?.httpBody?.debugDescription ?? "nil")
    print("VALUE: ", response.value ?? "nil")
    printJSON(response.data)
}

func printJSON(_ data: Data?){
    guard  let data = data else {
        print("JSON: vazio")
        print("FIM PRINT RESPONSE ==============>")
        return
    }
    do {
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
            print("JSON: vazio")
            print("FIM PRINT RESPONSE ==============>")
            return
        }
        print("JSON: ", json)
        print("FIM PRINT RESPONSE ==============>")
    }catch let e {
        print("JSON ERROR: ", e.localizedDescription)
        print("FIM PRINT RESPONSE ==============>")
    }
}
