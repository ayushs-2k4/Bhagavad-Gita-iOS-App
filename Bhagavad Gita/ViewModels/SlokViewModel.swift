//
//  SlokViewModel.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import Combine
import SwiftUI

@Observable
class SlokViewModel {
    var slok: SlokModel?
    var cancellables: [AnyCancellable] = []

    init(chapterNumber: Int, slokNumber: Int) {
         Task {
             await  getChapterInformationUsingAsyncAwait(chapterNumber: chapterNumber, slokNumber: slokNumber)
        }
    }

    func getChapterInformation(chapterNumber: Int, slokNumber: Int) {
        print("Downloading slok: \(chapterNumber) - \(slokNumber)")
        guard let url = URL(string: "https://bhagavadgitaapi.in/slok/\(chapterNumber)/\(slokNumber)") else {
            print("Error in making Slok url")
            return
        }

        print("url: \(url)")

        downloadData(url: url)
            .decode(type: SlokModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Success")

                case .failure(let error):
                    print("error: \(error)")
                }

            }, receiveValue: { [weak self] receivedSlok in
                self?.slok = receivedSlok
            })
            .store(in: &cancellables)
    }

    func getChapterInformationUsingAsyncAwait(chapterNumber: Int, slokNumber: Int) async {
        print("Downloading slok using async await: \(chapterNumber) - \(slokNumber)")
        guard let url = URL(string: "https://bhagavadgitaapi.in/slok/\(chapterNumber)/\(slokNumber)") else {
            print("Error in making Slok url")
            return
        }

        print("url: \(url)")

        do {
            let data = try await downloadDataWithAsyncAwait(url: url)
            let slok = try JSONDecoder().decode(SlokModel.self, from: data)

            await MainActor.run {
                self.slok = slok
            }
        }
        catch {
            print("error in downloading slok async await: \(error)")
        }
    }
}
