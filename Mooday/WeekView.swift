//
//  WeekView.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/12/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI

struct WeekView: View {
    @ObservedObject private var user = User()
    var geometry: GeometryProxy

    @Environment(\.managedObjectContext) var managedObjectContext
    var Fsix: FetchRequest<Day>
    var six: FetchedResults<Day>
    {
        Fsix.wrappedValue
    }
    
    var Ffive: FetchRequest<Day>
     var five: FetchedResults<Day>
     {
         Ffive.wrappedValue
     }
    
    var Ffour: FetchRequest<Day>
    var four: FetchedResults<Day>
    {
        Ffour.wrappedValue
    }
    
    var Fthree: FetchRequest<Day>
     var three: FetchedResults<Day>
     {
         Fthree.wrappedValue
     }
    
    var Ftwo: FetchRequest<Day>
     var two: FetchedResults<Day>
     {
         Ftwo.wrappedValue
     }
    
    var Fone: FetchRequest<Day>
    var one: FetchedResults<Day>
    {
        Fone.wrappedValue
    }
    
    var Fzero: FetchRequest<Day>
     var zero: FetchedResults<Day>
     {
         Fzero.wrappedValue
     }

    
    init(sixD: String, fiveD: String, fourD: String, threeD: String,
         twoD: String, oneD: String, zeroD: String, geometry: GeometryProxy)
    {
        self.geometry = geometry

        let six = NSPredicate(format: "title == %@", sixD)
        Fsix = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: six )
        
        let five = NSPredicate(format: "title == %@", fiveD)
        Ffive = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: five )
        
        let four = NSPredicate(format: "title == %@", fourD)
        Ffour = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: four )
        
        let three = NSPredicate(format: "title == %@", threeD)
        Fthree = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: three )
        
        let two = NSPredicate(format: "title == %@", twoD)
        Ftwo = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: two )
        
        let one = NSPredicate(format: "title == %@", oneD)
        Fone = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: one )
        
        let zero = NSPredicate(format: "title == %@", zeroD)
        Fzero = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: zero )
    }

//    var components = DateComponents()
//    let today = Calendar.current.date(from: components)
//    let yesterday = Calendar.
    
    var body: some View {
     VStack
        {
            
               
                HStack
                     {
                         DayView(dayD: previousDay(daysBack: 6),dayN: previousDayNum(daysBack: 6), geometry: geometry)
                         DayView(dayD: previousDay(daysBack: 5),dayN: previousDayNum(daysBack: 5), geometry: geometry)
                         DayView(dayD: previousDay(daysBack: 4),dayN: previousDayNum(daysBack: 4), geometry: geometry)
                         DayView(dayD: previousDay(daysBack: 3),dayN: previousDayNum(daysBack: 3), geometry: geometry)
                         DayView(dayD: previousDay(daysBack: 2),dayN: previousDayNum(daysBack: 2), geometry: geometry)
                         DayView(dayD: previousDay(daysBack: 1),dayN: previousDayNum(daysBack: 1), geometry: geometry)
                         DayView(dayD: previousDay(daysBack: 0),dayN: previousDayNum(daysBack: 0), geometry: geometry)

                     }.frame(width: geometry.size.width/14 * 8, height:  6 * geometry.size.height/30)

            .padding()


       
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
    func previousDayNum(daysBack: Int) -> Int
    {
        let dayback = daysBack
        var dayComponent = DateComponents()
        dayComponent.day = -dayback
        let calendar = Calendar.current
        let nextDay = calendar.date(byAdding: dayComponent, to: Date())!
        
        let dayint = calendar.dateComponents([.day], from: nextDay)
        
        return dayint.day!
        
        
    }

}


