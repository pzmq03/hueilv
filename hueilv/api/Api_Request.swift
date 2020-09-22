//
//  Api_Request.swift
//  hueilv
//
//  Created by 吴迪 on 2020/9/22.
//

import Foundation

// MARK: - 第一次启动
struct DeviceType:Request {
    
    typealias Response = GeneralResponse
    
    let deviceType: String
    
    init(deviceType: String) {
        self.deviceType = deviceType
    }
    
    func toDictionary() -> [String: Any] {
        return ["deviceType": deviceType]
    }
}
