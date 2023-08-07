//
//  SlokModel.swift
//  Bhagavad Gita
//
//  Created by Ayush Singhal on 07/08/23.
//

import SwiftUI

// MARK: - SlokModel

struct SlokModel: Codable,Hashable,Equatable {
    static func == (lhs: SlokModel, rhs: SlokModel) -> Bool {
        lhs._id == rhs._id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(_id)
    }
    
    let _id: String
    let chapter, verse: Int
    let slok, transliteration: String
    let tej: Tej
    let siva: Siva
    let purohit: Adi
    let chinmay: Chinmay
    let san, adi, gambir: Adi
    let madhav, anand: Anand
    let rams: Rams
    let raman, abhinav, sankar: Abhinav
    let jaya, vallabh, ms, srid: Anand
    let dhan, venkat, puru, neel: Anand

    init(_id: String, chapter: Int, verse: Int, slok: String, transliteration: String, tej: Tej, siva: Siva, purohit: Adi, chinmay: Chinmay, san: Adi, adi: Adi, gambir: Adi, madhav: Anand, anand: Anand, rams: Rams, raman: Abhinav, abhinav: Abhinav, sankar: Abhinav, jaya: Anand, vallabh: Anand, ms: Anand, srid: Anand, dhan: Anand, venkat: Anand, puru: Anand, neel: Anand) {
        self._id = _id
        self.chapter = chapter
        self.verse = verse
        self.slok = slok
        self.transliteration = transliteration
        self.tej = tej
        self.siva = siva
        self.purohit = purohit
        self.chinmay = chinmay
        self.san = san
        self.adi = adi
        self.gambir = gambir
        self.madhav = madhav
        self.anand = anand
        self.rams = rams
        self.raman = raman
        self.abhinav = abhinav
        self.sankar = sankar
        self.jaya = jaya
        self.vallabh = vallabh
        self.ms = ms
        self.srid = srid
        self.dhan = dhan
        self.venkat = venkat
        self.puru = puru
        self.neel = neel
    }

    init() {
        _id = ""
        chapter = 0
        verse = 0
        slok = ""
        transliteration = ""
        tej = Tej(author: "", ht: "")
        siva = Siva(author: "", et: "", ec: "")
        purohit = Adi(author: "", et: "")
        chinmay = Chinmay(author: "", hc: "")
        san = Adi(author: "", et: "")
        adi = Adi(author: "", et: "")
        gambir = Adi(author: "", et: "")
        madhav = Anand(author: "", sc: "")
        anand = Anand(author: "", sc: "")
        rams = Rams(author: "", ht: "", hc: "")
        raman = Abhinav(author: "", sc: "", et: "", ht: "")
        abhinav = Abhinav(author: "", sc: "", et: "", ht: "")
        sankar = Abhinav(author: "", sc: "", et: "", ht: "")
        jaya = Anand(author: "", sc: "")
        vallabh = Anand(author: "", sc: "")
        ms = Anand(author: "", sc: "")
        srid = Anand(author: "", sc: "")
        dhan = Anand(author: "", sc: "")
        venkat = Anand(author: "", sc: "")
        puru = Anand(author: "", sc: "")
        neel = Anand(author: "", sc: "")
    }
}

// MARK: - Abhinav

struct Abhinav: Codable {
    let author, sc, et: String
    let ht: String?
}

// MARK: - Adi

struct Adi: Codable {
    let author, et: String
}

// MARK: - Anand

struct Anand: Codable {
    let author, sc: String
}

// MARK: - Chinmay

struct Chinmay: Codable {
    let author, hc: String
}

// MARK: - Rams

struct Rams: Codable {
    let author, ht, hc: String
}

// MARK: - Siva

struct Siva: Codable {
    let author, et, ec: String
}

// MARK: - Tej

struct Tej: Codable {
    let author, ht: String
}
