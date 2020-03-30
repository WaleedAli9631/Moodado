//
//  JournalEntry+CoreDataProperties.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/1/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//
//
import SwiftUI
import Foundation
import CoreData

@objc(JournalEntry)
public class JournalEntry: NSManagedObject, Identifiable, Comparable {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<JournalEntry> {
        return NSFetchRequest<JournalEntry>(entityName: "JournalEntry")
    }
    
    @NSManaged public var mood: Int16
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var day: Day?
    
    
    @NSManaged public var exercise: Bool
    @NSManaged public var family: Bool
    @NSManaged public var friends: Bool
    @NSManaged public var goOut: Bool
    @NSManaged public var reading: Bool
    @NSManaged public var relax: Bool
    @NSManaged public var relationship: Bool
    @NSManaged public var tv: Bool
    @NSManaged public var eatBad: Bool
    @NSManaged public var eatWell: Bool
    @NSManaged public var gaming: Bool
    @NSManaged public var school: Bool
    @NSManaged public var sleepWell: Bool
    @NSManaged public var sleepBad: Bool
    @NSManaged public var work: Bool
    @NSManaged public var sport: Bool









//    public var wrappedMood: String
//    {
//        mood ?? "OK-ERROR"
//
//    }
    public override func willChangeValue(forKey key: String) {
        super.willChangeValue(forKey: key)
        self.objectWillChange.send()
    }
    
    public var wrappedDate: Date
    {
        date ?? Date()
    }
    
    public var wrappedID: UUID
    {
        id ?? UUID()
    }
    
    public static func <(lhs: JournalEntry, rhs: JournalEntry) -> Bool
    {
        return lhs.mood < rhs.mood
    }
    public static func >(lhs: JournalEntry, rhs: JournalEntry) -> Bool
    {
        return lhs.mood > rhs.mood
    }
    
    public static func getMoodString(entry: JournalEntry) -> String
    {
        if entry.mood == 1
        {
            return "Awful"
        }
        else if entry.mood == 2
        {
            return "Bad"
        }

        else if entry.mood == 3
        {
            return "Ok"
        }
        if entry.mood == 4
        {
            return "Good"
        }
        else if entry.mood == 5
        {
            return "Great"
        }
        else
        {
            return "error"
        }
        
    }
    public static func getMoodStringInt(entry: Int) -> String
    {
        if entry == 1
        {
            return "Awful"
        }
        else if entry  == 2
        {
            return "Bad"
        }

        else if entry == 3
        {
            return "Ok"
        }
        if entry == 4
        {
            return "Good"
        }
        else if entry == 5
        {
            return "Great"
        }
        else
        {
            return "error"
        }
        
    }

}
