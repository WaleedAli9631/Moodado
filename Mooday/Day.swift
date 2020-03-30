//
//  Day+CoreDataProperties.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/1/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//
//

import Foundation
import SwiftUI
import CoreData
import Combine

@objc(Day)
public class Day: NSManagedObject, Identifiable {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var day: Int16
    @NSManaged public var month: Int16
    @NSManaged public var year: Int16
    







    @NSManaged public var title: String?
    @NSManaged public var dayDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var entries: NSSet?
    

    public var entriesArray: [JournalEntry]
    {
        let set = entries as? Set<JournalEntry> ?? []
        
        return set.sorted
        {
            $0.wrappedDate < $1.wrappedDate
            
        }
    }
    
    public var wrappedDayDate: Date
    {
        dayDate ?? Date()
    }
    
//    public var wrappedIsExpanded: Bool
//    {
//        isExpanded ?? false
//    }
    
    public var wrappedTitle: String
    {
        title ?? "ERROR-TITLE"
    }
    
    
    public var wrappedID: UUID
     {
         id ?? UUID()
     }
     
    

    
    
}

// MARK: Generated accessors for entries
extension Day {
    
//    static func getAllDays() -> NSFetchRequest<Day>
//    {
//        let request: NSFetchRequest<Day> = Day.fetchRequest() as! NSFetchRequest<Day>
//        
//        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
//        
//        request.sortDescriptors = [sortDescriptor]
//        
//        return request
//    }
    
//    public override func willChangeValue(forKey key: String) {
//        super.willChangeValue(forKey: key)
//        self.objectWillChange.send()
//    }
    public static func getMin(entries: [JournalEntry]) -> Int16
    {
        var minval = 5
        for item in entries
        {
            if item.mood < minval
            {
                minval = Int(item.mood)
            }
        }
        
        return Int16(minval)

        
    }
    
    public static func getMax(entries: [JournalEntry]) -> Int16
    {
        var minval = 0
        for item in entries
        {
            if item.mood > minval
            {
                minval = Int(item.mood)
            }
        }
        
        return Int16(minval)

        
    }
    
    public static func getAvg(entries: [JournalEntry]) -> Double
    {
        var total = 0.0
        var avg = 0.0
        var counter = 0.0
        for item in entries
        {
            total += Double(item.mood)
            counter += 1
        }
        avg = total / counter
        return avg

        
    }

    @objc(addEntriesObject:)
    @NSManaged public func addToEntries(_ value: JournalEntry)

    @objc(removeEntriesObject:)
    @NSManaged public func removeFromEntries(_ value: JournalEntry)

    @objc(addEntries:)
    @NSManaged public func addToEntries(_ values: NSSet)

    @objc(removeEntries:)
    @NSManaged public func removeFromEntries(_ values: NSSet)

}
