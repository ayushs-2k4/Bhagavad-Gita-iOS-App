//
//  BookmarkModel.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 11/08/23.
//

import SwiftUI

// MARK: BookmarkModel

struct BookmarkModel: Codable, Identifiable {
    let id :String
    let chapterNumber: Int
    let slokNumber: Int
    
    init( chapterNumber: Int, slokNumber: Int) {
        self.id = UUID().uuidString
        self.chapterNumber = chapterNumber
        self.slokNumber = slokNumber
    }
}
