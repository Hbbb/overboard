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
    let boardUrl = "\(Config.Urls.local)/boards/1.json"
    request(url: boardUrl, method: .get)
  }
  
  func createBoard(text: String) {
    let boardUrl = "\(Config.Urls.local)/boards"
    let params: Parameters = ["content": text]
    
    request(url: boardUrl, method: .post, body: params)
  }
  
  private func request(url: String, method: HTTPMethod, body: Parameters = [:]) {
    var headers = [String: String]()
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "application/json"
    
    // TODO: Figure out how to conditionally pass the parameters argument when this is a POST request
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
