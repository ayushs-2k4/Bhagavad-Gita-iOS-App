//
//  SlokView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

struct SlokView: View {
    let chapterNumber: Int
    let slokNumber: Int
    @Binding var isEnglish: Bool

    @StateObject var slokViewModel: SlokViewModel

    @State var slok: SlokModel

    init(chapterNumber: Int, slokNumber: Int, isEnglish: Binding<Bool>) {
        self.chapterNumber = chapterNumber
        self.slokNumber = slokNumber
        self._isEnglish = isEnglish
        self._slokViewModel = StateObject(wrappedValue: SlokViewModel(chapterNumber: chapterNumber, slokNumber: slokNumber))

        self.slok = SlokModel() // Or you can initialize with appropriate value

//        if let ourSlok = slokViewModel.slok {
//            self.slok = ourSlok
//        }
    }

    var body: some View {
        ScrollView {
            if slokViewModel.slok == nil {
                ProgressView()
            } else {
                VStack {
//                    NavigationLink(value: slok, label: {
//                        Text("All Authors -->")
//                    })

                    TitleView(title: isEnglish ? "Verse" : "श्लोक")

                    Text(slokViewModel.slok?.slok ?? "No Slok")
                        .padding(.bottom, 25)
                        .multilineTextAlignment(.center)

                    Text("slok by slok: \(slok.slok)")
                        .padding(.bottom, 25)
                        .multilineTextAlignment(.center)

                    TitleView(title: isEnglish ? "Translation" : "अनुवाद")

                    Text(slokViewModel.slok?.rams.ht ?? "")
                        .padding(.bottom, 25)

                    TitleView(title: isEnglish ? "Explanation" : "व्याख्या")

                    Text(isEnglish ? slokViewModel.slok?.raman.et ?? "" : slokViewModel.slok?.rams.hc ?? "")
                }
                .padding(.horizontal)
            }
        }
        .navigationDestination(for: SlokModel.self) { slok in
            AllAuthorsView(slok: slok)
        }
        .navigationTitle(isEnglish ? "Chapter \(chapterNumber) - Verse \(slokNumber)" : "अध्याय \(chapterNumber) - श्लोक \(slokNumber)")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "globe")
                    .onTapGesture {
                        isEnglish.toggle()
                    }
            }
        }
        .onAppear(perform: {
            self.slok = slokViewModel.slok ?? SlokModel()
        })
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
    NavigationStack {
        @State var isEnglish = false

//        NavigationStack {
        SlokView(chapterNumber: 1, slokNumber: 1, isEnglish: $isEnglish)
//        }
    }
}
