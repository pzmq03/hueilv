//
//  Api_Response.swift
//  hueilv
//
//  Created by 吴迪 on 2020/9/22.
//

import Foundation
// MARK: - 通用
struct GeneralResponse: Decodable {
    var processResult: Bool
    var message: String
    var returnData: [String]?
    var fieldErrors: FieldErrors?
    var errorCode: String?
    
    struct FieldErrors: Decodable {
        var errorCode: String?
        var email: [String]?
    }
}

struct HuiLv: Decodable {
    var success: String
    var result: HuiResult
    
    struct HuiResult: Decodable {
        var status: String
        var scur: String
        var tcur: String
        var ratenm: String
        var rate: String
        var update: String
    }
}
