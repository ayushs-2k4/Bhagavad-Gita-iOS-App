//
//  ContentView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

struct AllChaptersView: View {
    var allChaptersViewModel = AllChaptersViewModel()
    @State var isEnglish: Bool = false
    @Environment(\.colorScheme) var colorScheme // Access color scheme

    var body: some View {
        NavigationStack {
            ZStack {
                if allChaptersViewModel.allChapters.isEmpty {
                    ProgressView()
                } else {
                    ScrollView {
                        ForEach(allChaptersViewModel.allChapters, id: \.chapter_number) { chapter in

                            NavigationLink(value: chapter, label: {
                                SingleChapterCardView(chapter: chapter, isEnglish: $isEnglish)
                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                            })
                        }
                    }
                }
            }
            .navigationDestination(for: ChapterModel.self) { chapter in
                ChapterInformationView(chapter: chapter, isEnglish: $isEnglish)
            }
            .navigationTitle(isEnglish ? "Bhagavad Gita" : "भगवद गीता")
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
}

struct SingleChapterCardView: View {
    let chapter: ChapterModel
    @Binding var isEnglish: Bool

    var body: some View {
        VStack {
            Text(isEnglish ? chapter.translation : chapter.name)
                .font(.title)
                .fontWeight(.bold)

            Spacer()
            Spacer()
            Spacer()

            Text(isEnglish ? "Verses: \(chapter.verses_count)" : "श्लोक: \(chapter.verses_count)")

            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()

            Text(isEnglish ? chapter.summary.en : chapter.summary.hi)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 2))
    }
}

#Preview {
    AllChaptersView()
}

// #Preview("SingleChapterCardView") {
//    @State var isEnglish = false
//
//    return SingleChapterCardView(chapter: ChapterModel(chapter_number: 1, verses_count: 47, name: "अर्जुनविषादयोग", translation: "Arjuna Visada Yoga", transliteration: "Arjun Viṣhād Yog", meaning: Meaning(en: "Arjuna's Dilemma", hi: "अर्जुन विषाद योग"), summary: Meaning(en: "The first chapter of the Bhagavad Gita - Arjuna Vishada Yoga introduces the setup, the setting, the characters and the circumstances that led to the epic battle of Mahabharata, fought between the Pandavas and the Kauravas. It outlines the reasons that led to the revelation of the of Bhagavad Gita.\nAs both armies stand ready for the battle, the mighty warrior Arjuna, on observing the warriors on both sides becomes increasingly sad and depressed due to the fear of losing his relatives and friends and the consequent sins attributed to killing his own relatives. So, he surrenders to Lord Krishna, seeking a solution. Thus, follows the wisdom of the Bhagavad Gita.", hi: "भगवद गीता का पहला अध्याय अर्जुन विशाद योग उन पात्रों और परिस्थितियों का परिचय कराता है जिनके कारण पांडवों और कौरवों के बीच महाभारत का महासंग्राम हुआ। यह अध्याय उन कारणों का वर्णन करता है जिनके कारण भगवद गीता का ईश्वरावेश हुआ। जब महाबली योद्धा अर्जुन दोनों पक्षों पर युद्ध के लिए तैयार खड़े योद्धाओं को देखते हैं तो वह अपने ही रिश्तेदारों एवं मित्रों को खोने के डर तथा फलस्वरूप पापों के कारण दुखी और उदास हो जाते हैं। इसलिए वह श्री कृष्ण को पूरी तरह से आत्मसमर्पण करते हैं। इस प्रकार, भगवद गीता के ज्ञान का प्रकाश होता है।")), isEnglish: $isEnglish)
// }
