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

    let bookmarksViewModel = BookmarksViewModel.instance

    var body: some View {
        ScrollView {
            ForEach(1 ..< chapter.verses_count + 1, id: \.self) { slokNumber in
                VStack(spacing: 10) {
                    NavigationLink(value: "\(chapter.chapter_number) \(slokNumber)", label: {
                        ChapterInformationRowView(chapterNumber: chapter.chapter_number, slokNumber: slokNumber, isEnglish: $isEnglish, isBookmarked: bookmarksViewModel.isBookmarked(chapterNumber: chapter.chapter_number, slokNumber: slokNumber))
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

#Preview {
    NavigationStack {
        @State var isEnglish = false

        ChapterInformationView(chapter: ChapterModel.testChapter, isEnglish: $isEnglish)
    }
}
