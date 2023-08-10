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

    static let testChapter = ChapterModel(chapter_number: 1, verses_count: 47, name: "अर्जुनविषादयोग", translation: "Arjuna Visada Yoga", transliteration: "Arjun Viṣhād Yog", meaning: Meaning(en: "Arjuna's Dilemma", hi: "अर्जुन विषाद योग"), summary: Meaning(en: "The first chapter of the Bhagavad Gita - Arjuna Vishada Yoga introduces the setup, the setting, the characters and the circumstances that led to the epic battle of Mahabharata, fought between the Pandavas and the Kauravas. It outlines the reasons that led to the revelation of the of Bhagavad Gita.\nAs both armies stand ready for the battle, the mighty warrior Arjuna, on observing the warriors on both sides becomes increasingly sad and depressed due to the fear of losing his relatives and friends and the consequent sins attributed to killing his own relatives. So, he surrenders to Lord Krishna, seeking a solution. Thus, follows the wisdom of the Bhagavad Gita.", hi: "भगवद गीता का पहला अध्याय अर्जुन विशाद योग उन पात्रों और परिस्थितियों का परिचय कराता है जिनके कारण पांडवों और कौरवों के बीच महाभारत का महासंग्राम हुआ। यह अध्याय उन कारणों का वर्णन करता है जिनके कारण भगवद गीता का ईश्वरावेश हुआ। जब महाबली योद्धा अर्जुन दोनों पक्षों पर युद्ध के लिए तैयार खड़े योद्धाओं को देखते हैं तो वह अपने ही रिश्तेदारों एवं मित्रों को खोने के डर तथा फलस्वरूप पापों के कारण दुखी और उदास हो जाते हैं। इसलिए वह श्री कृष्ण को पूरी तरह से आत्मसमर्पण करते हैं। इस प्रकार, भगवद गीता के ज्ञान का प्रकाश होता है।"))
}

func createChapter(chapterNumber: Int) -> ChapterModel {
    return ChapterModel(chapter_number: chapterNumber, verses_count: 0, name: "", translation: "", transliteration: "", meaning: Meaning(en: "", hi: ""), summary: Meaning(en: "", hi: ""))
}

// MARK: - Meaning

struct Meaning: Codable {
    let en, hi: String
}
