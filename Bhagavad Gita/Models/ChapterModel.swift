//
//  ContentView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

// MARK: AllChaptersModel

struct ChapterModel: Codable, Hashable {
    static func == (lhs: ChapterModel, rhs: ChapterModel) -> Bool {
        lhs.chapter_number == rhs.chapter_number
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(chapter_number)
    }
    
    let chapter_number, verses_count: Int
    let name, translation, transliteration: String
    let meaning, summary: Meaning
}

// MARK: - Meaning

struct Meaning: Codable {
    let en, hi: String
}
