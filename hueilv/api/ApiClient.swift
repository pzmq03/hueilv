//
//  ApiClient.swift
//  hueilv
//
//  Created by 吴迪 on 2020/9/22.
//

import UIKit

final class ApiClient {
    ///API
    class func huilvApi(completion: @escaping (HuiLv) -> Void) throws {
        let session = URLSession(configuration: .default)
        guard let url = "http://api.k780.com/?app=finance.rate&scur=JPY&tcur=CNY&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4".url else { throw RequestError.invalidParamError }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        //通信
        session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {return}
            print(data)
            do {
                let result = try HuiLv.decode(data: data)
                print(result)
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}

