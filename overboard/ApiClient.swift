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
    get(url: boardUrl)
  }
  
  func createBoard(text: String) {
    let boardUrl = "\(Config.Urls.local)/boards"
    let params: Parameters = ["content": text]
    
    post(url: boardUrl, body: params)
  }
  
  private func post(url: String, body: Parameters = [:]) {
    var headers = [String: String]()
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "application/json"
    
    Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default).responseJSON { response in
      if let json = response.result.value {
        print("JSON: \(json)")
      }
      
      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)")
      }
    }
  }
  
  private func get(url: String) {
    var headers = [String: String]()
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "application/json"
    
    Alamofire.request(url, method: .get, headers: headers).responseJSON { response in
      guard let json = response.result.value else { return }
      print("JSON: \(json)")
      
      if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        print("Data: \(utf8Text)") // original server data as UTF8 string
      }
    }
  }
}
