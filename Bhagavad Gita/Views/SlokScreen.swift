//
//  SlokScreen.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

struct SlokScreen: View {
    let chapterNumber: Int
    let slokNumber: Int
    @Binding var isEnglish: Bool

    var isBookmarked: Bool

    let bookmarksViewModel = BookmarksViewModel.instance

    @Environment(\.colorScheme) var colorScheme // Access color scheme

    var slokViewModel: SlokViewModel

    init(chapterNumber: Int, slokNumber: Int, isEnglish: Binding<Bool>) {
        self.chapterNumber = chapterNumber
        self.slokNumber = slokNumber
        self._isEnglish = isEnglish
        self.slokViewModel = SlokViewModel(chapterNumber: chapterNumber, slokNumber: slokNumber)

        self.isBookmarked = bookmarksViewModel.isBookmarked(chapterNumber: chapterNumber, slokNumber: slokNumber)
    }

    var body: some View {
        ScrollView {
            if slokViewModel.slok == nil {
                ProgressView()
            } else {
                VStack {
                    TitleView(title: isEnglish ? "Verse" : "श्लोक")

                    Text(slokViewModel.slok?.slok ?? "No Slok")
                        .padding(.bottom, 25)
                        .multilineTextAlignment(.center)
                        .textSelection(.enabled)

                    TitleView(title: isEnglish ? "Translation" : "अनुवाद")

                    Text(isEnglish ? slokViewModel.slok?.siva.et ?? "" : slokViewModel.slok?.rams.ht ?? "")
                        .padding(.bottom, 25)
                        .textSelection(.enabled)

                    TitleView(title: isEnglish ? "Explanation" : "व्याख्या")

                    Text(isEnglish ? slokViewModel.slok?.raman.et ?? "" : slokViewModel.slok?.rams.hc ?? "")
                        .textSelection(.enabled)

                    NavigationLink(value: slokViewModel.slok, label: {
                        HStack {
                            Text("All Explanations")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                        .background(colorScheme == .dark ? Color(red: 28/255, green: 28/255, blue: 30/255) : Color(red: 242/255, green: 242/255, blue: 247/255))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                }
                .padding(.horizontal)
            }
        }
        .navigationDestination(for: SlokModel.self) { slok in
            AllAuthorsScreen(slok: slok)
        }
        .navigationTitle(isEnglish ? "Chapter \(chapterNumber) - Verse \(slokNumber)" : "अध्याय \(chapterNumber) - श्लोक \(slokNumber)")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                    .contentTransition(.symbolEffect(.automatic))
                    .onTapGesture {
                        if isBookmarked {
                            bookmarksViewModel.deleteBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)
                        } else {
                            bookmarksViewModel.addBookmark(chapterNumber: chapterNumber, slokNumber: slokNumber)
                        }
                    }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "globe")
                    .onTapGesture {
                        isEnglish.toggle()
                    }
            }
        }
    }
}

struct TitleView: View {
    let title: String

    var body: some View {
        HStack {
            Image(.leftDesign)
                .resizable()
                .scaledToFit()

            Text(title)
                .bold()

            Image(.rightDesign)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    @State var isEnglish = false

    return NavigationStack {
        SlokScreen(chapterNumber: 1, slokNumber: 1, isEnglish: $isEnglish)
    }
}
