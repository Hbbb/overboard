//
//  Board.swift
//  overboard
//
//  Created by Harrison Borges on 7/16/18.
//  Copyright © 2018 ping. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Board: Object, Decodable {
  @objc dynamic var text = ""
  @objc dynamic var createdAt = Date()
  @objc dynamic var updatedAt = Date()
  @objc dynamic var boardId = 0

  convenience init(text: String, createdAt: Date, updatedAt: Date, boardId: Int) {
    self.init()
    self.text = text
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.boardId = boardId
  }

  override static func primaryKey() -> String? {
    return "boardId"
  }

  enum BoardKeys: String, CodingKey {
    case text, createdAt, updatedAt, boardId
  }
  
  convenience required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: BoardKeys.self)
    let text = try container.decode(String.self, forKey: .text)
    let createdAt = try container.decode(Date.self, forKey: .createdAt)
    let updatedAt = try container.decode(Date.self, forKey: .updatedAt)
    let boardId = try container.decode(Int.self, forKey: .boardId)
    
    self.init(text: text, createdAt: createdAt, updatedAt: updatedAt, boardId: boardId)
  }
  
  required init() {
    super.init()
  }
  
  //  FIXME: Implement a better solution to this, because this sucks.
  required init(realm: RLMRealm, schema: RLMObjectSchema) {
    fatalError("init(realm:schema:) has not been implemented")
  }
  
  required init(value: Any, schema: RLMSchema) {
    fatalError("init(value:schema:) has not been implemented")
  }
}
