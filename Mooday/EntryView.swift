//
//  AddView.swift
//  Journal
//
//  Created by CSUFTitan on 2/26/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI

class EntryData: ObservableObject {
    @Published var save = false
    @Published var type = "Ok"
    @Published var typeNum = 3

    @Published var reading = false
    @Published var exercise = false
    @Published var relax = false
    @Published var goOut = false
    @Published var family = false
    @Published var friends = false
    
    @Published var relationship = false
    @Published var tv = false
    @Published var eatBad = false
    @Published var eatWell = false
    @Published var gaming = false
    @Published var school = false
    @Published var sleepWell = false
    @Published var sleepBad = false
    @Published var work = false
    @Published var sport = false
    
    func ConvertType()
    {
           if self.type == "Awful"
           {
               self.typeNum = 1
           }
           else if self.type == "Bad"
           {
               self.typeNum = 2
           }
           else if self.type == "Ok"
           {
               self.typeNum = 3
           }
           else if self.type == "Good"
           {
               self.typeNum = 4
           }
           else if self.type == "Great"
           {
               self.typeNum = 5
           }
        
    }
}

struct EntryView: View
{
    @EnvironmentObject var user: User
    @EnvironmentObject var entryData: EntryData

    @Environment(\.managedObjectContext) var managedObjectContext
    var geometry: GeometryProxy

    
    
    @FetchRequest(entity: Day.entity(), sortDescriptors: []) var days: FetchedResults<Day>
    @State private var type = "Ok"
    static let types = ["Awful","Bad", "Ok", "Good","Great"]

    
    
    var body: some View
    {
        VStack
        {

            HStack
            {
                 Text("Add Entry")
            }
            ScrollView
            {
                ZStack
                {
                    Rectangle()
                        .frame(width: geometry.size.width * 0.95, height: 100 )
                        .foregroundColor(Color("MyWhite"))
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                        .padding(.top)
                    .overlay(HStack()
                    {
                        VStack
                        {
                            Image("Awful")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.type == EntryView.types[0] ? Color("MyRed") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.type = EntryView.types[0]
                                }
                            Text("Awful")
                        }
                        
                        VStack
                        {
                            Image("Bad")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.type == EntryView.types[1] ? Color("MyOrange") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.type = EntryView.types[1]
                                }
                            Text("Bad")
                        }
                        
                        VStack
                        {
                            Image("Ok")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.type == EntryView.types[2] ? Color("MyYellow") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.type = EntryView.types[2]
                                }
                            Text("Ok")
                        }
                        VStack
                        {
                            Image("Good")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.type == EntryView.types[3] ? Color("MyYellowGreen") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.type = EntryView.types[3]
                                }
                            Text("Good")
                        }
                        
                        VStack
                        {
                            Image("Great")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.type == EntryView.types[4] ? Color("MyGreen") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.type = EntryView.types[4]
                                }
                            Text("Great")
                        }
                        
                    }.padding(.top).padding(.bottom) ,alignment: .center)
                        .padding(.trailing,20).padding(.leading, 20)
                    
                }
                
                
// activity section 1
                ZStack
                {
                    Rectangle()
                        .frame(width: geometry.size.width * 0.95, height: 100 )
                        .foregroundColor(Color("MyWhite"))
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                    .overlay(HStack()
                    {
                        VStack
                        {
                            Image("read")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.reading == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.reading.toggle()
                                }
                            Text("Read")
                        }
                        
                        VStack
                        {
                            Image("exercise")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.exercise == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.exercise.toggle()
                                }
                            Text("Exercise")
                        }
                        
                        VStack
                        {
                            Image("relax")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.relax == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.relax.toggle()
                                }
                            Text("Relax")
                        }
                        
                        VStack
                        {
                            Image("gaming")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.gaming == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.gaming.toggle()
                                }
                            Text("Gaming")
                        }
                        
                        VStack
                        {
                            Image("tv")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.tv == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.tv.toggle()
                                }
                            Text("TV")
                        }
                        
                    }.padding(.top).padding(.bottom) ,alignment: .center)
                        .padding(.trailing,20).padding(.leading, 20)
                    
                }
                
// end activity section 1
// activity section 2
                ZStack
                {
                    Rectangle()
                        .frame(width: geometry.size.width * 0.95, height: 100 )
                        .foregroundColor(Color("MyWhite"))
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                    .overlay(HStack()
                    {
                        VStack
                        {
                            Image("goOut")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.goOut == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.goOut.toggle()
                                }
                            Text("Socialize")
                        }
                        
                        VStack
                        {
                            Image("family")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.family == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.family.toggle()
                                }
                            Text("Family")
                        }
                        
                        VStack
                        {
                            Image("friends")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.friends == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.friends.toggle()
                                }
                            Text("Friends")
                        }
                        VStack
                        {
                            Image("relationship")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.relationship == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.relationship.toggle()
                                }
                            Text("Relationship")
                        }
                        
                        VStack
                        {
                            Image("sport")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.sport == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.sport.toggle()
                                }
                            Text("Sport")
                        }
                        
                    }.padding(.top).padding(.bottom) ,alignment: .center)
                        .padding(.trailing,20).padding(.leading, 20)
                    
                }
// end activity section 2
// activity section 3
                ZStack
                {
                    Rectangle()
                        .frame(width: geometry.size.width * 0.95, height: 100 )
                        .foregroundColor(Color("MyWhite"))
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                    .overlay(HStack()
                    {
                        VStack
                        {
                            Image("eatBad")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.eatBad == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.eatBad.toggle()
                                }
                            Text("Bad Food")
                        }
                        
                        VStack
                        {
                            Image("eatWell")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.eatWell == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.eatWell.toggle()
                                }
                            Text("Good Food")
                        }
                        
                        VStack
                        {
                            Image("sleepBad")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.sleepBad == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.sleepBad.toggle()
                                }
                            Text("Bad Sleep")
                        }
                        
                        VStack
                        {
                            Image("sleepWell")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.sleepWell == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.sleepWell.toggle()
                                }
                            Text("Good Sleep")
                        }
                        
                    }.padding(.top).padding(.bottom) ,alignment: .center)
                        .padding(.trailing,20).padding(.leading, 20)
                    
                }
// end activity section 3
//activity section 4

                
                ZStack
                {
                    Rectangle()
                        .frame(width: geometry.size.width * 0.95, height: 100 )
                        .foregroundColor(Color("MyWhite"))
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                    .overlay(HStack()
                    {
                        VStack
                        {
                            Image("work")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.work == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.work.toggle()
                                }
                            Text("Work")
                        }
                        
                        VStack
                        {
                            Image("school")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                .foregroundColor(self.entryData.school == true ? Color("EntryColor") : .gray)
                                .onTapGesture
                                {
                                    self.entryData.school.toggle()
                                }
                            Text("School")
                        }
                        
                        
                    }.padding(.top).padding(.bottom) ,alignment: .center)
                        .padding(.trailing,20).padding(.leading, 20)
                    
                }
// end activity section 4
                
                
                
            }
            

        }
        
    }

}
struct EntryLabel: ViewModifier {
    var color = Color("MyRed")
    var geometry: GeometryProxy
    func body(content: Content) -> some View {
        content
            .frame(width: geometry.size.width/7, height: 50)
    }
}
