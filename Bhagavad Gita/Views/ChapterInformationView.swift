//
//  ChapterInformationView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

struct ChapterInformationView: View {
    let chapter: ChapterModel
    @Binding var isEnglish: Bool
    @Environment(\.colorScheme) var colorScheme // Access color scheme

    var body: some View {
        ScrollView {
            ForEach(1 ..< chapter.verses_count + 1, id: \.self) { value in
                VStack(spacing: 10) {
                    NavigationLink(value: "\(chapter.chapter_number) \(value)", label: {
                        RowView(title: isEnglish ? "Verse: \(value)" : "श्लोक: \(value)")
                            .padding(.vertical, 5)
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                    })
                }
            }
        }
        .navigationDestination(for: String.self) { str in
            let components = str.components(separatedBy: " ")
            let chapt = Int(components[0]) ?? 1
            let slokNo = Int(components[1]) ?? 1
            SlokView(chapterNumber: chapt, slokNumber: slokNo, isEnglish: $isEnglish)
        }
        .navigationTitle(isEnglish ? chapter.translation : chapter.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "globe")
                    .onTapGesture {
                        isEnglish.toggle()
                    }
            }
        }
    }
}

struct RowView: View {
    let title: String
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Capsule().stroke(Color.yellow, lineWidth: 2))
            .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        @State var isEnglish = false

        ChapterInformationView(chapter: ChapterModel(chapter_number: 1, verses_count: 47, name: "अर्जुनविषादयोग", translation: "Arjuna Visada Yoga", transliteration: "Arjun Viṣhād Yog", meaning: Meaning(en: "Arjuna's Dilemma", hi: "अर्जुन विषाद योग"), summary: Meaning(en: "The first chapter of the Bhagavad Gita - Arjuna Vishada Yoga introduces the setup, the setting, the characters and the circumstances that led to the epic battle of Mahabharata, fought between the Pandavas and the Kauravas. It outlines the reasons that led to the revelation of the of Bhagavad Gita.\nAs both armies stand ready for the battle, the mighty warrior Arjuna, on observing the warriors on both sides becomes increasingly sad and depressed due to the fear of losing his relatives and friends and the consequent sins attributed to killing his own relatives. So, he surrenders to Lord Krishna, seeking a solution. Thus, follows the wisdom of the Bhagavad Gita.", hi: "भगवद गीता का पहला अध्याय अर्जुन विशाद योग उन पात्रों और परिस्थितियों का परिचय कराता है जिनके कारण पांडवों और कौरवों के बीच महाभारत का महासंग्राम हुआ। यह अध्याय उन कारणों का वर्णन करता है जिनके कारण भगवद गीता का ईश्वरावेश हुआ। जब महाबली योद्धा अर्जुन दोनों पक्षों पर युद्ध के लिए तैयार खड़े योद्धाओं को देखते हैं तो वह अपने ही रिश्तेदारों एवं मित्रों को खोने के डर तथा फलस्वरूप पापों के कारण दुखी और उदास हो जाते हैं। इसलिए वह श्री कृष्ण को पूरी तरह से आत्मसमर्पण करते हैं। इस प्रकार, भगवद गीता के ज्ञान का प्रकाश होता है।")), isEnglish: $isEnglish)
    }
}

#Preview("RowView") {
    RowView(title: "Verse: 1")
}
