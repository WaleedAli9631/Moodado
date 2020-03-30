//
//  User.swift
//  Journal
//
//  Created by CSUFTitan on 2/26/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI

class User: ObservableObject
{
  enum Locations
    {
        case ListView
        case StatsView
        case EntryView
        case SettingsView
        case CalendarView
        case BeginningView
        case DeleteView
    }
    @Published var Location = Locations.ListView
    @Published var showPopUp = false

    @Published var UserName = ""
    @Published var ViewHistory = [Locations.ListView]
    @Published var currentNumber = 1
    
    @Published var calendarComps = Calendar.current
    @Published var dateFormatter = DateFormatter()
    @Published var date = Date()
    
    
    @Published var currentDay = 1
    @Published var currentMonth = 1
    @Published var currentYear = 2020
    
    @Published var monthFilter = 1
    @Published var yearFilter = 2020
    @Published var moodFilter = 3
    
    @Published var indexToDelete = 0
    
    @Published var topHidden = false



    @Published var showBeginning = Bool(true)
    {
         didSet
        {
            let encoder = JSONEncoder()

            if let encoded = try?
            encoder.encode(showBeginning)
            {
                UserDefaults.standard.set(encoded, forKey: "List")
            }
        }
    }

    init()
    {
        self.dateFormatter.locale = .current
        self.dateFormatter.dateFormat = "MMMM d, yyyy"

        let components = self.calendarComps.dateComponents([.day,.month,.year], from: Date())
        self.currentMonth = components.month!
        self.currentYear = components.year!
        self.currentDay = components.day!
        self.monthFilter = self.currentMonth
        self.yearFilter = self.currentYear
        self.moodFilter = 3
        self.indexToDelete = 0

        
        if let items = UserDefaults.standard.data(forKey: "List")
        {
            let decoder = JSONDecoder()

            if let decoded = try?
                decoder.decode(Bool.self, from: items)
            {
                self.showBeginning = decoded
                return
            }
        }

    }

    
}

extension String
{
    subscript(i: Int) -> String
    {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
