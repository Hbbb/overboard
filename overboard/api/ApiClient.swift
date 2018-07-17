//
//  ApiClient.swift
//  overboard
//
//  Created by Harrison Borges on 6/6/18.
//  Copyright © 2018 ping. All rights reserved.
//

import Foundation
import Alamofire

struct ApiClient {
  func getBoard() {
    let boardUrl = Config.Urls.local + "/board"
    request(url: boardUrl, method: .get)
  }
  
  private func request(url: String, method: HTTPMethod) {
    var headers = [String: String]()
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "application/json"
    
    Alamofire.request(url, method: method, headers: headers).responseJSON { response in
      print("Response: \(String(describing: response.response))") // http url response
      print("Result: \(response.result)")                         // response serialization result
      
      if let json = response.result.value {
        print("JSON: \(json)") // serialized json response
      }
      
      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
      }
    }
  }
}
