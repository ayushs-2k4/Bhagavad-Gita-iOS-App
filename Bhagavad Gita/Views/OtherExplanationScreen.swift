//
//  OtherExplanationsScreen.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

struct OtherExplanationsScreen: View {
    let author: String
    var sc: String? = nil
    var ht: String? = nil
    var hc: String? = nil
    var et: String? = nil
    var ec: String? = nil

    var body: some View {
        ScrollView {
            VStack {
                TextView(explanation: sc, fullForm: "Sanskrit Translation")
                
                TextView(explanation: ht, fullForm: "Hindi Translation")
                
                TextView(explanation: hc, fullForm: "Hindi Translation")
                
                TextView(explanation: et, fullForm: "English Translation")
                
                TextView(explanation: ec, fullForm: "English Translation")
            }
            .navigationTitle(author)
        }
    }
}

struct TextView: View {
    let explanation: String?
    let fullForm: String

    var body: some View {
        if let explanation {
            VStack {
                Text(fullForm)
                    .bold()
                    .padding(.bottom)
                

                
                Text(explanation)
                    .textSelection(.enabled)
                
                Text("\n")
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        OtherExplanationsScreen(author: "Swami Tejomayananda", et: "1.1 Dhritarashtra said  What did my people and the sons of Pandu do when they had assembled\ntogether eager for battle on the holy plain of Kurukshetra, O Sanjaya.",
                             ec: "1.1 धर्मक्षेत्रे on the holy plain? कुरुक्षेत्रे in Kurukshetra? समवेताः assembled together? युयुत्सवः desirous to fight? मामकाः my people? पाण्डवाः the sons of Pandu? च and? एव also? किम् what? अकुर्वत did do? सञ्जय O Sanjaya.Commentary Dharmakshetra -- that place which protects Dharma is Dharmakshetra. Because it was in the land of the Kurus? it was called Kurukshetra.Sanjaya is one who has conered likes and dislikes and who is impartial.")
    }
}
