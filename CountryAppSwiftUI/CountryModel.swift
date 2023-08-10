//
//  CountryModel.swift
//  CountryAppSwiftUI
//
//  Created by Khushboo on 14/09/22.
//

import Foundation
import SwiftUI
import Combine

struct countries : Identifiable {
    var id = String()
    
    var country = String()
}


class CountryStore : ObservableObject {
    @Published var name = [countries]()
}











/*
class CountryModel {
    @Published var country: [countryName] = []
    init() {
        getItem()
    }
    func getItem(){
        let newName = [
        countryName(title: "india"),
        countryName(title: "usa"),
        countryName(title: "pakistan")
        
        ]
        country.append(contentsOf: newName)
    }
    func deleteItem(IndexSet: IndexSet) {
        country.remove(atOffsets: IndexSet)
    }

}
*/
