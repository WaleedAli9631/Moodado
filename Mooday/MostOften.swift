//
//  MostOften.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/9/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI

struct MostOften: View {
    
    var geometry: GeometryProxy

    @EnvironmentObject private var user: User
    var fetchRequest: FetchRequest<JournalEntry>
    var entries: FetchedResults<JournalEntry>
    {
        fetchRequest.wrappedValue
    }

    
    
    
    init(moodFilter: Int, geometry: GeometryProxy)
    {
        let moodPred = NSPredicate(format: "mood == %i", moodFilter)
        self.geometry = geometry

        fetchRequest = FetchRequest<JournalEntry>(entity: JournalEntry.entity(), sortDescriptors: [], predicate: moodPred)
        

    }
    var body: some View {
        VStack
        {
            

            Image(getFirst(keynum: 0))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
            Image(getFirst(keynum: 1))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
            Image(getFirst(keynum: 2))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
            Image(getFirst(keynum: 3))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
            Image(getFirst(keynum: 4))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .modifier(EntryLabel(color: Color("MyBlack"), geometry: self.geometry))
            

            

        }

    }
    
    public static func getMostOften(entries: FetchedResults<JournalEntry>) -> [(key: String, value: Int)]
    {
        var activities = [String: Int]()
        var exerciseCounter = 0
        var readingCounter = 0
        var relaxingCounter = 0

        var goOutCounter = 0
        var familyCounter = 0
        var friendsCounter = 0
        
        var relationshipCounter = 0
        var tvCounter = 0
        var eatBadCounter = 0
        var eatWellCounter = 0
        var gamingCounter = 0
        var schoolCounter = 0
        var sleepWellCounter = 0
        var sleepBadCounter = 0
        var workCounter = 0
        var sportCounter = 0

        for item in entries
        {
            if item.exercise == true
            {
                exerciseCounter += 1
            }
            if item.reading == true
            {
                readingCounter += 1
            }
            if item.relax == true
            {
                relaxingCounter += 1
            }
            
            if item.relationship == true
            {
                relationshipCounter += 1
            }
            if item.tv == true
            {
                tvCounter += 1
            }
            if item.eatBad == true
            {
                eatBadCounter += 1
            }
            if item.eatWell == true
            {
                eatWellCounter += 1
            }
            if item.gaming == true
            {
                gamingCounter += 1
            }
            if item.school == true
            {
                schoolCounter += 1
            }
            if item.sleepWell == true
            {
                sleepWellCounter += 1
            }
            if item.sleepBad == true
            {
                sleepBadCounter += 1
            }
            if item.work == true
            {
                workCounter += 1
            }
            if item.sport == true
            {
                sportCounter += 1
            }
            if item.goOut  == true
            {
                goOutCounter += 1
            }
            if item.family  == true
            {
                familyCounter += 1
            }
            if item.friends  == true
            {
                friendsCounter += 1
            }
        }
        activities["exercise"] = exerciseCounter
        activities["read"] = readingCounter
        activities["relax"] = relaxingCounter

        activities["goOut"] = goOutCounter
        activities["family"] = familyCounter
        activities["friends"] = friendsCounter
        
        activities["relationship"] = relationshipCounter
        activities["tv"] = tvCounter
        activities["eatBad"] = eatBadCounter
        activities["eatWell"] = eatWellCounter
        activities["gaming"] = gamingCounter
        activities["school"] = schoolCounter
        activities["sleepWell"] = sleepWellCounter
        activities["sleepBad"] = sleepBadCounter
        activities["work"] = workCounter
        activities["sport"] = sportCounter
        
        return activities.sorted
            {if $0.value == $1.value
            {
                return  $0.key < $1.key
            }
            else
            {
                return $0.value > $1.value
            }
                }

    }
    
    func getFirst(keynum: Int) -> String
    {
        
        let keyAndValues = MostOften.getMostOften(entries: entries)
        let keys = keyAndValues.map{$0.key}
        let values = keyAndValues.map{$0.value}
        if values[keynum] >= 1
        {
            return keys[keynum]
        }
        else
        {
            return "blank"
        }
    }
}



