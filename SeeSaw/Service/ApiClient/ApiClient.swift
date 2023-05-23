//
//  ApiClient.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/07.
//

import Alamofire
import Foundation
import KeychainSwift

class ApiClient: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://ec2-3-36-172-10.ap-northeast-2.compute.amazonaws.com"

    func getValues(year: Int, completion: @escaping ([String]) -> Void) {
        let url = "\(baseUrl)/api/value?year=\(year)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetValuesResponse.self) { response in
                switch response.result {
                case .success(let res):
                    var values: [String] = []
                    for value in res.result {
                        values.append(value.valueName)
                    }
                    completion(values)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
    
    func getValuesWithValueId(year: Int, completion: @escaping ([Int: String]) -> Void) {
        let url = "\(baseUrl)/api/value?year=\(year)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetValuesResponse.self) { response in
                switch response.result {
                case .success(let res):
                    var values: [Int: String] = [Int: String]()
                    for value in res.result {
                        values[value.valueId] = value.valueName
                    }
                    completion(values)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
}
