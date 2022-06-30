//
//  AdvancedSearchView.swift
//  Characters
//
//  Created by Christo Kumar on 30/06/22.
//

import SwiftUI

struct RoundedButton : View {
    var name : String = ""
    var status : String = ""
    var species : String = ""
    var type: String = ""
    var gender : String = ""
    
    var body: some View {
        NavigationLink(destination:
            Text("Hello")) {
            Button(action: {}){
                HStack {
                    Spacer()
                    Text("Search")
                        .font(.headline)
                    Spacer()
                }
            }
            .padding(.vertical, 10.0)
            .padding(.horizontal, 50)
        }
    }
}

struct AdvancedSearchView: View {
    var statuses = ["alive","dead","unknown"]
    var genders = ["female","male","genderless","unknown"]
    @State private var selectedStatus = 0
    @State private var selectedGender = 0
    @State private var name: String = ""
    @State private var status: String = ""
    @State private var species : String = ""
    @State private var type : String = ""
    @State private var gender : String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Basic Data")) {
                TextField("Name",text: $name)
            }
            
            Section(header: Text("Other data")) {
                Picker (selection: $selectedStatus, label: Text("Status")) {
                    ForEach(0 ..< statuses.count) {
                        Text(self.statuses[$0].capitalized)
                    }
                }.pickerStyle(SegmentedPickerStyle()).padding()
                
                Picker (selection: $selectedGender, label: Text("Gender")) {
                    ForEach(0 ..< genders.count) {
                        Text(self.genders[$0].capitalized)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
            }
            
            RoundedButton(name: name,
                          status: statuses[selectedStatus],
                          species: species,
                          type: type,
                          gender: genders[selectedGender])
    }
}

struct AdvancedSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedSearchView()
    }
}
}
