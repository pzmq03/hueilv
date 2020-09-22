//
//  Api.swift
//  hueilv
//
//  Created by 吴迪 on 2020/9/22.
//

import UIKit

public protocol Request: Encodable {
    //方便泛型使用
    associatedtype Response: Decodable
    //Request转换成字典类型
    func toDictionary() -> [String: Any]
}

extension Dictionary {
    ///制作httpBody发送用类型
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}


extension Decodable {
    /// 解码api得到数据
    static func decode(data: Data) throws -> Self {
        try JSONDecoder().decode(Self.self, from: data)
    }
}
extension CharacterSet {
    ///制作httpBody发送用类型内,不包括 ”？”或“ /”
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
public extension String {
    /// 直接获取URL
    var url: URL? {
        URL(string: self)
    }
}
///api错误模式
enum RequestError: Error {
    case postGetNoResultError
    case invalidParamError
}
