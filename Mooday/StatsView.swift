//
//  StatsView.swift
//  Journal
//
//  Created by CSUFTitan on 2/26/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//
import SwiftUI
//import Charts


struct StatsView: View {

    
var geometry: GeometryProxy
@State var type = "Ok"
    

@EnvironmentObject private var user: User
@Environment(\.managedObjectContext) var managedObjectContext
var fetchRequest: FetchRequest<Day>
var days: FetchedResults<Day>
{
    fetchRequest.wrappedValue
}


init(monthFilter: Int, yearFilter: Int, geometry: GeometryProxy)
{
    self.geometry = geometry
    let monthPred = NSPredicate(format: "month == %i", monthFilter)
    let yearPred = NSPredicate(format: "year == %i", yearFilter)
    

    fetchRequest = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [monthPred,yearPred]))
}

    var body: some View
    {
        ScrollView
        {
            VStack
            {
                
    //            WeekView()
    //            HStack{
    //                ForEach(Calendar.getWeek)
    //            }
                Rectangle()
                    .frame(width: geometry.size.width * 0.95, height: 100 )
                    .foregroundColor(Color("MyWhite"))
                    .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                    .padding(.top)
                .overlay(HStack()
                {
                    Text("Average Mood: ")
                    Image(JournalEntry.getMoodStringInt(entry: Int(StatsView.getMonthlyAvg(days: days))))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                        .foregroundColor(Color(StatsView.getMoodColorString(moodInt: Int(StatsView.getMonthlyAvg(days: days)))))
                    
                        
                })
                
                Rectangle()
                    .frame(width: geometry.size.width * 0.95, height: 300)
                    .foregroundColor(Color("MyWhite"))
                    .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                    .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                .overlay(VStack()
                {
                    Text("Weekly Overview")
                    .padding(.top)
                    .padding()

                    WeekView(sixD: previousDay(daysBack: 6), fiveD: previousDay(daysBack: 5), fourD: previousDay(daysBack: 4), threeD: previousDay(daysBack: 3), twoD: previousDay(daysBack: 2), oneD: previousDay(daysBack: 1), zeroD: previousDay(daysBack: 0), geometry: geometry)
                    .padding()
                    
                        
                })
                .padding()

    //            ZStack
    //            {
                    Rectangle()
                        .frame(width: geometry.size.width * 0.95, height: 600)
                        .foregroundColor(Color("MyWhite"))
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                        .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                    .overlay(VStack()
                    {
                        Text("Top Five Activities")
                            .padding(.top)
                            .padding()
                        Divider()
                            .padding()
                        HStack
                        {
                                VStack
                                {
                                    Image("Awful")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                        .foregroundColor(self.user.moodFilter == 1 ? Color("MyRed") : .gray)
                                        .onTapGesture
                                        {
                                            self.type = "Awful"
                                            self.user.moodFilter = 1
                                        }
                                    Text("Awful")
                                }
                                
                                VStack
                                {
                                    Image("Bad")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                        .foregroundColor(self.user.moodFilter == 2 ? Color("MyOrange") : .gray)
                                        .onTapGesture
                                        {
                                            self.type = "Bad"

                                            self.user.moodFilter = 2
                                        }
                                    Text("Bad")
                                }
                                
                                VStack
                                {
                                    Image("Ok")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                        .foregroundColor(self.user.moodFilter == 3 ? Color("MyYellow") : .gray)
                                        .onTapGesture
                                        {
                                            self.type = "Ok"

                                            self.user.moodFilter = 3
                                        }
                                    Text("Ok")
                                }
                                VStack
                                {
                                    Image("Good")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                        .foregroundColor(self.user.moodFilter == 4 ? Color("MyYellowGreen") : .gray)
                                        .onTapGesture
                                        {
                                            self.type = "Good"

                                            self.user.moodFilter = 4
                                        }
                                    Text("Good")
                                }
                                
                                VStack
                                {
                                    Image("Great")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
                                        .foregroundColor(self.user.moodFilter == 5 ? Color("MyGreen") : .gray)
                                        .onTapGesture
                                        {
                                            self.type = "Great"

                                            self.user.moodFilter = 5
                                        }
                                    Text("Great")
                                }
                        }
                        Divider()
                            .padding(.top)
                            .padding()
                        MostOften(moodFilter: user.moodFilter, geometry: self.geometry)
                            
                            
                        }.padding(.top).padding(.bottom) ,alignment: .center)
                            .padding(.trailing,20).padding(.leading, 20)

                Spacer()

            }
        }
        
    }
    
    func previousDay(daysBack: Int) -> String
    {
        let dayback = daysBack
        var dayComponent = DateComponents()
        dayComponent.day = -dayback
        let calendar = Calendar.current
        let nextDay = calendar.date(byAdding: dayComponent, to: Date())!
        return user.dateFormatter.string(from: nextDay)
        
    }

    
    public static func getNumDays(days: FetchedResults<Day>) -> [Double]
    {

        var list: [Double] = []
        for item in days
        {
            list.append(Double(Day.getAvg(entries: item.entriesArray)))
        }
        
        return list
    }
    
    public static func getMonthlyAvg(days: FetchedResults<Day>) -> Double
    {
        var counter = 0.0
        var total = 0.0
        var avg = 0.0
        for item in days
        {
            total += Day.getAvg(entries: item.entriesArray)
            counter += 1
        }
        
        if counter == 0
        {
            return 3
        }
        avg = total/counter
        return avg
        
    }
    
    public static func getMoodColorString(moodInt: Int) -> String
    {
        if moodInt == 1
        {
            return "MyRed"
        }
        else if moodInt == 2
        {
            return "MyOrange"
        }
        else if moodInt == 3
        {
            return "MyYellow"
        }
        else if moodInt == 4
        {
            return "MyYellowGreen"
        }
        else
        {
            return "MyGreen"
        }
        
        
    }
    
    
}
