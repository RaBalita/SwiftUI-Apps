//
//  FoodOrderView.swift
//  PracticeGenius
//
//  Created by Balita on 9/16/23.
//

import SwiftUI

struct FoodOrderView: View {
    @State var isMenu: Bool = true
    let burgerMeatsArray: [String] = ["Boeuf", "Poulet", "Poisson", "Veggie"]
    @State var burgerMeatIndex: Int = 0
    @State var nbTranchesViande: Int = 0
    @State var nbTranchesConcombre: Int = 0
    @State var withKetchup: Bool = false
    @State var withMayo: Bool = false
    @State var bonheurRate: Double = 50
    
    let boissonArray: [String] = ["Soda", "Coca", "Thé glacé", "Heineken", "Bazooka"]
    @State var boissonIndex: Int = 0
    @State var withBigFries: Bool = true
    
    
    @State var prenom: String = ""
    @State var phone: String = ""
    @FocusState var focusedPhone: Bool
    @State var heure: Date = Date()
    @State var summary: String = ""
    
    var body: some View {
        Form {
            Section("COMPOSEZ VOTRE COMMANDE") {
                Toggle(isMenu ? "Menu" : "Burger simple", isOn: $isMenu)
                HStack{
                    Spacer()
                    Image(burgerMeatsArray[burgerMeatIndex])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                    Spacer()
                }
                Picker(burgerMeatsArray[burgerMeatIndex], selection: $burgerMeatIndex) {
                    ForEach(0..<burgerMeatsArray.count, id: \.self) { i in
                        Text(burgerMeatsArray[i]).tag(i)
                    }                }.pickerStyle(.segmented)
                Stepper(value: $nbTranchesViande, in: 0...5) {
                    HStack{
                        Image("bacon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                        Text("Nombre de tranches : \(nbTranchesViande)")
                    }
                }
                Stepper(value: $nbTranchesConcombre, in: 0...5) {
                    HStack{
                        Image("gherkin")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                        Text("Nombre de tranches : \(nbTranchesConcombre)")
                    }
                }
                Toggle(isOn: $withKetchup) {
                    HStack{
                        Image("ketchup")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                        Text("Ketchup ?")
                    }
                }.tint(.red)
                Toggle(isOn: $withMayo) {
                    HStack{
                        Image("mustard")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                        Text("Mayonnaise ?")
                    }
                }.tint(.yellow)
                VStack {
                    HStack{
                        Image("cheese")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                        Text("\(Int(bonheurRate))% de fromage en plus !")
                    }
                    Slider(value: $bonheurRate, in: 0...100, step: 1)
                }
                
                
            }
            
            if (isMenu) {
                Section("POUR LE MENU") {
                    Picker("\(boissonArray[boissonIndex])", selection: $boissonIndex) {
                        ForEach(0..<boissonArray.count, id: \.self) { i in
                            Text(boissonArray[i]).tag(i)
                        }
                    }
                    
                    Toggle(isOn: $withBigFries) {
                        HStack{
                            Image("fries")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 40, height: 40)
                            Text(withBigFries ? "Grandes Frites" : "Petites Frites")
                        }
                    }.tint(.orange)
                }
            }
            
            Section("INFORMATIONS") {
                TextField("Nom de la commande", text: $prenom)
                HStack {
                    TextField("Numéro de téléphone", text: $phone)
                        .keyboardType(.numberPad)
                        .focused($focusedPhone)
                    Button("OK"){
                        focusedPhone = false
                    }
                }
                DatePicker("Heure de livraison / retrait",
                           selection: $heure,
                           displayedComponents: .hourAndMinute)
                
            }
            
            Section("RECAPITULATIF"){
                Button("Je commande") {
                    SummarizeCommand()
                }
                TextEditor(text: $summary)
            }
        }
        
    }
    
    func SummarizeCommand(){
        let formatterDateOnly = DateFormatter()
        formatterDateOnly.dateStyle = .short
        formatterDateOnly.timeStyle = .none
        formatterDateOnly.locale = Locale(identifier: "fr-FR")
        
        
        let formatterTimeOnly = DateFormatter()
        formatterTimeOnly.dateStyle = .none
        formatterTimeOnly.timeStyle = .short
        formatterTimeOnly.locale = Locale(identifier: "fr-FR")
        
        var sum = "-- Commande de \(prenom) du \(formatterDateOnly.string(from: heure)) --\n"
        sum += isMenu ? "un menu composé de:\nun burger " : "un burger simple "
        switch(burgerMeatIndex) {
        case 0:
            sum += "au boeuf,\n"
        case 1:
            sum += "au poulet,\n"
        case 2:
            sum += "au poisson,\n"
        case 3:
            sum += "végétarien,\n"
        default:
            sum += "au boeuf,\n"
        }
        
        if (burgerMeatIndex != 3) {
            sum += nbTranchesViande == 0 ? "": "avec \(nbTranchesViande) tranches de bacon, "
        }
        sum += nbTranchesConcombre == 0 ? "": "avec \(nbTranchesConcombre) tranches de concombre, "
        
        sum += withKetchup ?  "avec ketchup, ": "sans ketchup, "
        sum += withMayo  ?  "avec mayonnaise": "sans mayonnaise"
        
        if (isMenu){
            sum += ", avec un \(boissonArray[boissonIndex]), "
            sum += withBigFries ? "des grandes frites" : "des petites frites"
        }
        
        sum += " et \(bonheurRate)% de fromage !\n"
        sum += "Votre numéro de téléphone: \(phone).\nLivraison prévue pour \(formatterTimeOnly.string(from: heure)).\n-- Merci de votre commande. --"
        
        summary = sum
        
    }
}

struct FoodOrderView_Previews: PreviewProvider {
    static var previews: some View {
        FoodOrderView()
    }
}
