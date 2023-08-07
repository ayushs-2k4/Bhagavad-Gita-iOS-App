//
//  OtherExplanationView.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

struct AllAuthorsView: View {
    var slok: SlokModel

    var body: some View {
        List {
            NavigationLink {
                OtherExplanationView(author: slok.tej.author, ht: slok.tej.ht)
            } label: {
                Text(slok.tej.author)
            }

            NavigationLink {
                OtherExplanationView(author: slok.siva.author, et: slok.siva.et, ec: slok.siva.ec)
            } label: {
                Text(slok.siva.author)
            }

            NavigationLink {
                OtherExplanationView(author: slok.purohit.author, et: slok.siva.et)
            } label: {
                Text(slok.purohit.author)
            }

            NavigationLink {
                OtherExplanationView(author: slok.chinmay.author, hc: slok.chinmay.hc)
            } label: {
                Text(slok.chinmay.author)
            }

            NavigationLink {
                OtherExplanationView(author: slok.adi.author, et: slok.adi.et)
            } label: {
                Text(slok.adi.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.gambir.author, et: slok.gambir.et)
            } label: {
                Text(slok.gambir.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.madhav.author, sc: slok.madhav.sc)
            } label: {
                Text(slok.madhav.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.anand.author, sc: slok.anand.sc)
            } label: {
                Text(slok.anand.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.rams.author, ht: slok.rams.ht, hc: slok.rams.hc)
            } label: {
                Text(slok.rams.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.raman.author, sc: slok.raman.sc, et: slok.raman.et)
            } label: {
                Text(slok.raman.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.abhinav.author, sc: slok.abhinav.sc, et: slok.abhinav.et)
            } label: {
                Text(slok.abhinav.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.sankar.author, sc: slok.sankar.sc, ht: slok.sankar.ht, et: slok.sankar.et)
            } label: {
                Text(slok.sankar.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.jaya.author, sc:slok.jaya.sc)
            } label: {
                Text(slok.jaya.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.vallabh.author, sc: slok.vallabh.sc)
            } label: {
                Text(slok.vallabh.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.ms.author,  sc: slok.ms.sc)
            } label: {
                Text(slok.ms.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.srid.author, sc: slok.srid.sc)
            } label: {
                Text(slok.srid.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.dhan.author, sc: slok.dhan.sc)
            } label: {
                Text(slok.dhan.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.venkat.author, sc: slok.venkat.sc)
            } label: {
                Text(slok.venkat.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.puru.author, sc: slok.puru.sc)
            } label: {
                Text(slok.puru.author)
            }
            
            NavigationLink {
                OtherExplanationView(author: slok.neel.author, sc: slok.neel.sc)
            } label: {
                Text(slok.neel.author)
            }
        }
        .navigationTitle("All Authors")
    }
}

#Preview {
    NavigationStack {
        AllAuthorsView(slok: SlokModel())
    }
}
