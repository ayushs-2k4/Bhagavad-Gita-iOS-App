//
//  ChapterInformationRowView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 11/08/23.
//

import SwiftUI

struct ChapterInformationRowView: View {
    let chapterNumber: Int
    let slokNumber: Int
    @Binding var isEnglish: Bool
    var isBookmarked: Bool

    let bookmarksViewModel = BookmarksViewModel.instance

    var body: some View {
        HStack {
            Text(isEnglish ? "Chapter \(chapterNumber) - Verse \(slokNumber)" : "अध्याय \(chapterNumber) - श्लोक \(slokNumber)")

            Spacer()

            Button {
                if isBookmarked {
                    bookmarksViewModel.deleteBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)
                } else {
                    bookmarksViewModel.addBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)
                }
            } label: {
                Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Capsule().stroke(Color.yellow, lineWidth: 2))
        .padding(.horizontal)
    }
}

#Preview("RowView") {
    @State var isEnglish = false
    let isBookmarked = true
    
    return ChapterInformationRowView(chapterNumber: 1, slokNumber: 1, isEnglish: $isEnglish, isBookmarked: isBookmarked)
}
