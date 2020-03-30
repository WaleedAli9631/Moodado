//
//  DayView.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/12/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI

struct DayView: View {
    @ObservedObject private var user = User()
    var geometry: GeometryProxy
    var dayNum: Int

    @Environment(\.managedObjectContext) var managedObjectContext
    var Fday: FetchRequest<Day>
    var day: FetchedResults<Day>
    {
        Fday.wrappedValue
    }


    
    init(dayD: String, dayN: Int, geometry: GeometryProxy)
    {
        self.geometry = geometry
        self.dayNum = dayN
        let day = NSPredicate(format: "title == %@", dayD)
        Fday = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: day )
        
    }
    var body: some View
    {
        VStack
        {
            if day.isEmpty
            {
                Spacer()
                Rectangle()
                .frame(width: 20, height: 2)
                
                Text("\(dayNum)")
                .font(.footnote)
                .frame(height: 20)
            }
            else
            {
                if Day.getAvg(entries: day[0].entriesArray) >= 4 && Day.getAvg(entries: day[0].entriesArray) <= 5
                {
                    VStack
                    {
                      // 4
                      Spacer()
                        MoodIconChart(num: Int(Day.getAvg(entries: day[0].entriesArray)))
//                      Text("\((String(format: "%.1f", Day.getAvg(entries: day[0].entriesArray))))")
//                        .font(.footnote)
//                        .rotationEffect(.degrees(-90))
                        .offset(y: 35)
                        .zIndex(1)
                      // 5
                      Rectangle()
                        .fill(Color(.green))
                        .frame(width: geometry.size.width/14, height: CGFloat(Day.getAvg(entries: day[0].entriesArray)) * geometry.size.height/30)
                      
                      // 6
                        Text("\(day[0].day)")
                        .font(.footnote)
                        .frame(height: 20)
                    }

                }
                else if Day.getAvg(entries: day[0].entriesArray) >= 3 && Day.getAvg(entries: day[0].entriesArray) < 4
                {
                    VStack
                    {
                      // 4
                      Spacer()
                      MoodIconChart(num: Int(Day.getAvg(entries: day[0].entriesArray)))

                        .offset(y: 35)
                        .zIndex(1)
                      // 5
                      Rectangle()
                        .fill(Color(.yellow))
.frame(width: geometry.size.width/14, height: CGFloat(Day.getAvg(entries: day[0].entriesArray)) * geometry.size.height/30)
                      // 6
                            Text("\(day[0].day)")
                        .font(.footnote)
                        .frame(height: 20)
                    }

                }
                else if Day.getAvg(entries: day[0].entriesArray) >= 2 && Day.getAvg(entries: day[0].entriesArray) < 3
                {
                    VStack
                    {
                      // 4
                      Spacer()
                      MoodIconChart(num: Int(Day.getAvg(entries: day[0].entriesArray)))

                        .offset(y: 35)
                        .zIndex(1)
                      // 5
                      Rectangle()
                        .fill(Color(.orange))
.frame(width: geometry.size.width/14, height: CGFloat(Day.getAvg(entries: day[0].entriesArray)) * geometry.size.height/30)
                      // 6
                            Text("\(day[0].day)")
                        .font(.footnote)
                        .frame(height: 20)
                    }

                }
                else if Day.getAvg(entries: day[0].entriesArray) >= 1 && Day.getAvg(entries: day[0].entriesArray) < 2
                {
                    VStack
                    {
                      // 4
                      Spacer()
                      MoodIconChart(num: Int(Day.getAvg(entries: day[0].entriesArray)))
                        .offset(y: 35)
                        .zIndex(1)
                      // 5
                      Rectangle()
                        .fill(Color(.red))
.frame(width: geometry.size.width/14, height: CGFloat(Day.getAvg(entries: day[0].entriesArray)) * geometry.size.height/30)
                      // 6
                            Text("\(day[0].day)")
                        .font(.footnote)
                        .frame(height: 20)
                    }

                }
                else if Day.getAvg(entries: day[0].entriesArray) >= 0 && Day.getAvg(entries: day[0].entriesArray) < 1
                {
                    VStack
                    {
                      // 4
                      Spacer()
                      MoodIconChart(num: Int(Day.getAvg(entries: day[0].entriesArray)))

                        .offset(y: 35)
                        .zIndex(1)
                      // 5
                      Rectangle()
                        .fill(Color(.red))
.frame(width: geometry.size.width/14, height: CGFloat(Day.getAvg(entries: day[0].entriesArray)) * geometry.size.height/30)
                      // 6
                            Text("\(day[0].day)")
                        .font(.footnote)
                        .frame(height: 20)
                    }

                }


                else
                {
                    Text("ERRRORORORORR")
                }
            }
        }

    }
}



struct MoodIconChart: View
{
    let num: Int
    
    var body: some View
    {
        VStack
        {
            if num == 1
            {
                Image("Awful")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(Color("MyBlack"))
            }
            else if num == 2
            {
                Image("Bad")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(Color("MyBlack"))
            }
            else if num == 3
            {
                Image("Ok")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(Color("MyBlack"))
            }
            else if num == 4
            {
                Image("Good")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(Color("MyBlack"))
            }
            else if num == 5
            {
                Image("Great")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(Color("MyBlack"))
            }

        }
    }
}
