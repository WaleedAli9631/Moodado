//
//  TabView.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/3/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI

struct TabView: View
{
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var entryData: EntryData

    @EnvironmentObject var user: User
    var geometry: GeometryProxy
    
    var body: some View
    {
      
            
                ZStack
                {
                    if self.user.showPopUp
                    {
                        AddMenu()
                            .offset(y: -geometry.size.height/6)
                    }
                    HStack
                        {
                            Spacer()
                            Image("Journal_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                                .frame(width: geometry.size.width/5, height: 75)
                                .foregroundColor(self.user.Location == User.Locations.ListView ? Color("MyBlack") : Color("test"))
                                .onTapGesture
                                {                            self.user.ViewHistory.append(User.Locations.ListView)
                                    
                                    self.user.Location = User.Locations.ListView
                                    self.user.topHidden = false
                                    self.entryData.save = false

                            }
                            Spacer()
                            ZStack
                                {
                                    Circle()
                                        .foregroundColor(Color("test"))
                                        .frame(width: 50, height: 60)
                                        .overlay(
                                        Circle()
                                            .stroke(Color("MyBlue"), lineWidth: 3)
                                        )
//                                        .shadow(color: Color("Light Shadow"), radius: 8, x: -8, y: -8)
//                                        .shadow(color: Color("Dark Shadow"), radius: 8, x: 8, y: 8)
                                    if self.entryData.save == false
                                    {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color("MyBlack"))
                                            .rotationEffect(Angle(degrees: self.user.showPopUp ? 90 : 0))
                                            .onTapGesture {
                                                withAnimation()
                                                {
                                                    self.entryData.save.toggle()
                                                }
                                                self.user.ViewHistory.append(User.Locations.EntryView)
                                                self.user.Location = User.Locations.EntryView
                                                self.user.topHidden = true

                                        }
                                    }
                                    else
                                    {
                                        Image("checkmark")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color("MyBlack"))
                                        .onTapGesture
                                        {

                                            self.entryData.ConvertType()
                                            let calendarComps = Calendar.current
                                            let components = calendarComps.dateComponents([.day,.month,.year], from: Date())
                                            let item = JournalEntry(context: self.managedObjectContext)
                                            item.mood = Int16(self.entryData.typeNum)
                                            
                                            
                                            
                                            item.reading = self.entryData.reading
                                            item.exercise = self.entryData.exercise
                                            item.relax = self.entryData.relax
                                            item.gaming = self.entryData.gaming
                                            item.tv = self.entryData.tv


                                            item.goOut = self.entryData.goOut
                                            item.family = self.entryData.family
                                            item.friends = self.entryData.friends
                                            item.relationship = self.entryData.relationship
                                            item.sport = self.entryData.sport

                                            
                                            
                                            item.eatBad = self.entryData.eatBad
                                            item.eatWell = self.entryData.eatWell
                                            item.sleepWell = self.entryData.sleepWell
                                            item.sleepBad = self.entryData.sleepBad
                                            
                                            item.school = self.entryData.school
                                            item.work = self.entryData.work
                                            
                                            item.date = Date()
                                            item.id = UUID()
                                            item.day = Day(context: self.managedObjectContext)
                                            item.day?.dayDate = self.user.dateFormatter.date(from: self.user.dateFormatter.string(from: item.date!))
                                            item.day?.title = self.user.dateFormatter.string(from: item.date!)
                                            item.day?.id = UUID()
                                            item.day?.day = Int16(components.day!)
                                            item.day?.month = Int16(components.month!)
                                            item.day?.year = Int16(components.year!)
                                            

                                            try? self.managedObjectContext.save()
                                            
                                            self.entryData.type = "Ok"
                                            self.entryData.typeNum = 3
                                            
                                            self.entryData.reading = false
                                            self.entryData.exercise = false
                                            self.entryData.relax = false
                                            self.entryData.gaming = false
                                            self.entryData.tv = false


                                            self.entryData.goOut = false
                                            self.entryData.family = false
                                            self.entryData.friends = false
                                            self.entryData.relationship = false
                                            self.entryData.sport = false

                                            
                                            
                                            self.entryData.eatBad = false
                                            self.entryData.eatWell = false
                                            self.entryData.sleepWell = false
                                            self.entryData.sleepBad = false
                                            
                                            self.entryData.school = false
                                            self.entryData.work = false
                                            
                                            self.user.ViewHistory.append(User.Locations.ListView)
                                            self.user.Location = User.Locations.ListView
                                            self.user.topHidden = false
                                            withAnimation()
                                            {
                                                self.entryData.save.toggle()
                                            }
                                        }
                                    }

                                    
                            }
                            .offset(y: -geometry.size.height/15/2)
//                            .onTapGesture
//                            {
//                                    withAnimation()
//                                    {
//                                            self.user.showPopUp.toggle()
//                                    }
//                            }
                            Spacer()
                            Image("Graph_Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                                .frame(width: geometry.size.width/5, height: 75)
                                .foregroundColor(self.user.Location == User.Locations.StatsView ? Color("MyBlack") : Color("test"))
                                .onTapGesture
                                {
                                    self.user.ViewHistory.append(User.Locations.StatsView)
                                    
                                    self.user.Location = User.Locations.StatsView
                                    self.user.topHidden = false
                                    self.entryData.save = false

                                }
                            Spacer()
                            

                            
                            
//                            Image("Calendar_Icon")
//                                .resizable()
//                                .aspectRatio(contentMode:  .fit)
//                                .padding(20)
//                                .frame(width: geometry.size.width/5, height:75)
//                                .foregroundColor(self.user.Location == User.Locations.CalendarView ? Color("MyBlack") : Color("test"))
//
//                                .onTapGesture
//                                {
//                                    self.user.ViewHistory.append(User.Locations.CalendarView)
//
//                                    self.user.Location = User.Locations.CalendarView
//
//                                    self.user.topHidden = false
//
//                                }
//
//
//                            Image("Settings_Icon")
//                                .resizable()
//                                .aspectRatio(contentMode:  .fit)
//                                .padding(20)
//                                .frame(width: geometry.size.width/5, height:75)
//                                .foregroundColor(self.user.Location == User.Locations.SettingsView ? Color("MyBlack") : Color("test"))
////                                .shadow(color: Color("Light Shadow"), radius: 8, x: -8, y: -8)
////                                .shadow(color: Color("Dark Shadow"), radius: 8, x: 8, y: 8)
//
//
//                                .onTapGesture
//                                {
//                                    self.user.ViewHistory.append(User.Locations.SettingsView)
//
//                                    self.user.Location = User.Locations.SettingsView
//
//                                    self.user.topHidden = false
//
//                            }
                            
                    }
//                    .frame(width: geometry.size.width, height: geometry.size.height/10)
//                    .background(Color("Background"))
            }.background(Color("MyBlue"))
        
    }
    
    struct SaveButton: View
    {
        @Binding var reading: Bool
        @Binding var exercise: Bool
        @Binding var relax: Bool
        @Binding var goOut: Bool
        @Binding var family: Bool
        @Binding var friends: Bool
        
        @Binding var relationship: Bool
        @Binding var tv: Bool
        @Binding var eatBad: Bool
        @Binding var eatWell: Bool
        @Binding var gaming: Bool
        @Binding var school: Bool
        @Binding var sleepWell: Bool
        @Binding var sleepBad: Bool
        @Binding var work: Bool
        @Binding var sport: Bool
        var body: some View
        {
            Image("checkmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(Color("MyBlack"))
        }
    }
    
    
    struct AddMenu: View
    {
        @EnvironmentObject var user: User

        var body: some View
        {
            HStack(spacing: 50)
            {
                ZStack {
                    Circle()
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                        Image(systemName: "plus.rectangle.on.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                }
                .onTapGesture
                {
                    self.user.showPopUp.toggle()
                    self.user.ViewHistory.append(User.Locations.EntryView)

                    self.user.Location = User.Locations.EntryView
                    self.user.topHidden = true

                }
                ZStack {
                    Circle()
                        .foregroundColor(Color.blue)
                        .frame(width: 70, height: 70)
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                }
            }
                
            .transition(.scale)
        }
    }
}
