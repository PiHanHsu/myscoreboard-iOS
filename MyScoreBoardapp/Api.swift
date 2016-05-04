//
//  Api.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 5/4/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum HttpMethod {
    case HttpMethodGet
    case HttpMethodPost
    case HttpMethodPatch
}

typealias HttpCallbackSuccess = (code: Int, data: JSON) -> Void
typealias HttpCallbackFailure = (code: Int?, data: JSON?) -> Void
typealias HttpCallbackComplete = () -> Void

class HttpManager {
    
    static let sharedInstance = HttpManager()
    
    let baseUrl: String = ""
    
    func request(httpMethod: HttpMethod, path: String, param: [String: AnyObject]?, success: HttpCallbackSuccess? = nil, failure: HttpCallbackFailure? = nil, complete: HttpCallbackComplete? = nil) {
        
        var method: Alamofire.Method = .GET
        let encode: ParameterEncoding = .URLEncodedInURL
        
        switch httpMethod {
        case .HttpMethodGet:
            method = .GET
        case .HttpMethodPost:
            method = .POST
        case .HttpMethodPatch:
            method = .PATCH
        }
        
        Alamofire
            .request(method, baseUrl + path, parameters: param, encoding: encode, headers: nil)
            .responseJSON { (response) in
                switch response.result {
                case .Success(let data):
                    let code = response.response?.statusCode
                    
                    if code != nil && code! >= 200 && code! < 300 {
                        success?(code: code!, data: JSON(data))
                    } else {
                        failure?(code: code, data: JSON(data))
                    }
                case .Failure(_):
                    print("no data responsed")
                    failure?(code: nil, data: nil)
                }
                
                complete?()
        }
    }
    
    func uploadData(path: String, name: String, data: NSData, success: HttpCallbackSuccess? = nil, failure: HttpCallbackFailure? = nil, complete: HttpCallbackComplete? = nil) {
        
        Alamofire
            .upload(
                .POST,
                baseUrl + path,
                multipartFormData: { multipartFormData in
                    multipartFormData.appendBodyPart(data: data, name: name, fileName: "\(name).jpg", mimeType: "image/jpeg")
                },
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .Success(let upload, _, _):
                        upload.responseJSON { response in
                            switch response.result {
                            case .Success(let data):
                                let code = response.response?.statusCode
                                
                                if code != nil && code! >= 200 && code! < 300 {
                                    success?(code: code!, data: JSON(data))
                                } else {
                                    failure?(code: code, data: JSON(data))
                                }
                            case .Failure(_):
                                print("no data responsed")
                                failure?(code: nil, data: nil)
                            }
                        }
                    case .Failure:
                        failure?(code: nil, data: nil)
                    }
                    
                    complete?()
                }
        )
    }
}

