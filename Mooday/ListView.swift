//
//  ListView.swift
//  Journal
//
//  Created by CSUFTitan on 2/26/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI


struct ListView: View
{
    
    @EnvironmentObject private var user: User
    @Environment(\.managedObjectContext) var managedObjectContext
    var geometry: GeometryProxy

    var fetchRequest: FetchRequest<Day>
    var days: FetchedResults<Day>
    {
        fetchRequest.wrappedValue
    }
    @State var test = 0
    
    
    private var bounds: CGRect { UIScreen.main.bounds }
    
    init(monthFilter: Int, yearFilter: Int, geometry: GeometryProxy)
    {
        let monthPred = NSPredicate(format: "month == %i", monthFilter)
        let yearPred = NSPredicate(format: "year == %i", yearFilter)
        self.geometry = geometry


        fetchRequest = FetchRequest<Day>(entity: Day.entity(), sortDescriptors: [], predicate: NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [monthPred,yearPred]))
    }
    
    var body: some View
    {

        
        return VStack(alignment: .leading)
        {

                ScrollView
                {
                    Spacer(minLength: 20)
                    ForEach(Array(days.enumerated()), id: \.element)
                     {index, item in
                        ZStack
                        {
                            ParentList(geometry: self.geometry, isExpanded: false, day: self.days[index],index: index, days: self.days)
                                .modifier(ListRowModifer())
                                .animation(.linear(duration: 0.3))
//
                        }




                    }
                    Spacer(minLength: 20)

                }
//            }

        }.background(Color("MyGray"))
    }

    
}

struct ParentList: View
{
    var geometry: GeometryProxy

    @State var isExpanded: Bool
    let day: Day
    @GestureState var isLongPressed = false
    @EnvironmentObject private var user: User
    let index: Int
    @State var delete = false
    @Environment(\.managedObjectContext) var managedObjectContext
    let days: FetchedResults<Day>

    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            if delete == false
            {
                 HStack
                 {
//                     Spacer(minLength: 10)
                     ZStack(alignment: .leading)
                     {
                         
                         
                         Rectangle()
                         .frame(width: geometry.size.width * 0.95, height: 45)
                         .foregroundColor(Color("MyWhite"))
                         .shadow(color: Color("MyDarkGray"), radius: 8, x: -8, y: -8)
                         .shadow(color: Color("MyDarkGray"), radius: 8, x: 8, y: 8)
                         
         
                         Text("\(day.wrappedTitle)").font(.headline)
                         .offset(x: 20)
        


                     }
//                     Spacer(minLength: 10)
                 }.contentShape(Rectangle())
                 .onTapGesture {self.isExpanded = !self.isExpanded}
                 .simultaneousGesture(LongPressGesture(minimumDuration: 2)
                 .updating(self.$isLongPressed)
                     {
                         value, state, transcation in
                         state = value
                     }
                     .onEnded
                    { _ in
                         self.delete = true
                     print("Pressed!")
                    })
                 .scaleEffect(self.isLongPressed ? 0.8 : 1)

                 .animation(.spring())
            }
            else
            {
                HStack
                 {
//                     Spacer(minLength: 10)
                     ZStack(alignment: .leading)
                     {
                         
                         
                         Rectangle()
                         .frame(width: geometry.size.width * 0.95, height: 100)
                         .foregroundColor(Color("MyWhite"))
                         .shadow(color: Color("MyGray"), radius: 8, x: -8, y: -8)
                         .shadow(color: Color("MyGray"), radius: 8, x: 8, y: 8)
                        
         
                        VStack
                        {
                            HStack
                            {
                                Spacer()
                                Text("Remove this day?").font(.headline)
                                Spacer()
                            }
                            .padding()
                            HStack
                            {
                                Spacer()
                                Rectangle()
                                .foregroundColor(Color("MyBlue").opacity(0.9))
                                .overlay(Text("Yes").font(.headline), alignment: .center)
                                .frame(width: self.geometry.size.width/3, height: 50)
                                .onTapGesture
                                {
                                    self.user.indexToDelete = self.index
                                   for entry in self.days[self.user.indexToDelete].entriesArray
                                    {
                                    self.managedObjectContext.delete(entry)
                                    }
                                    self.managedObjectContext.delete(self.days[self.user.indexToDelete])
                                    try? self.managedObjectContext.save()
                                    self.delete = false
                                }
                                Spacer()
                                Rectangle()
                                .foregroundColor(Color("MyBrightRed").opacity(0.95))
                                .overlay(Text("No").font(.headline), alignment: .center)
                                .frame(width: self.geometry.size.width/3, height: 50)
                                .onTapGesture
                                {
                                    self.delete = false
                                }
                                Spacer()
                            }
                        }
        


                     }
//                     Spacer(minLength: 10)
                 }.contentShape(Rectangle())
            }

           

            
            
            if isExpanded
            {
                VStack(alignment:. leading)
                {
                    Divider()
                    .padding(.leading, 10)
                    .padding(.trailing, 10)


                    ForEach(day.entriesArray)
                    {entry in
                        ChildList(geometry: self.geometry, entry: entry)
                        .padding()
                        
                    }
                    Divider()
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                }
            }
        }
    }
}
struct ChildList: View
{
    @Environment(\.managedObjectContext) var managedObjectContext

    var geometry: GeometryProxy

    @GestureState var isLongPressed = false
    @State var delete = false
    let entry: JournalEntry
    
    
    
    var body: some View
    {
        VStack//(alignment: .leading)
        {
            if delete == false
            {
                HStack
                {
                    

                    VStack
                    {
                        Text("\(getDateString(entry: self.entry))")
                        MoodIcon(entry: entry)
                        Text(JournalEntry.getMoodString(entry: entry))
                    }
                    .padding()
                    ActivitiesDisplayer(entry: entry)
                }
                 .simultaneousGesture(LongPressGesture(minimumDuration: 2)
                                .updating(self.$isLongPressed)
                                    {
                                        value, state, transcation in
                                        state = value
                                    }
                                    .onEnded
                                   { _ in
                                        self.delete = true
                                    print("Pressed!")
                                   })
                                .scaleEffect(self.isLongPressed ? 0.8 : 1)

                                .animation(.spring())
                
            }
            else
            {
                HStack
                 {
//                     Spacer(minLength: 10)
                     ZStack(alignment: .leading)
                     {
                         
                         
                         Rectangle()
                         .frame(width: geometry.size.width * 0.95, height: 100)
                         .foregroundColor(Color("MyWhite"))
                         .shadow(color: Color("MyGray"), radius: 8, x: -8, y: -8)
                         .shadow(color: Color("MyGray"), radius: 8, x: 8, y: 8)
                        
         
                        VStack
                        {
                            HStack
                            {
                                Spacer()
                                Text("Remove this entry?").font(.headline)
                                Spacer()
                            }
                            .padding()
                            HStack
                            {
                                Spacer()
                                Rectangle()
                                .foregroundColor(Color("MyBlue").opacity(0.9))
                                .overlay(Text("Yes").font(.headline), alignment: .center)
                                .frame(width: self.geometry.size.width/3, height: 50)
                                .onTapGesture
                                {
                                    if(self.entry.day!.entriesArray.count == 1)
                                    {
                                        self.managedObjectContext.delete(self.entry.day!)
                                    }
                                    
                                    self.managedObjectContext.delete(self.entry)
                                   
                                    try? self.managedObjectContext.save()
                                    self.delete = false
                                }
                                Spacer()
                                Rectangle()
                                .foregroundColor(Color("MyBrightRed").opacity(0.95))
                                .overlay(Text("No").font(.headline), alignment: .center)
                                 .frame(width: self.geometry.size.width/3, height: 50)
                                .onTapGesture
                                {
                                    self.delete = false
                                }
                                Spacer()
                            }
                        }
        


                     }
//                     Spacer(minLength: 10)
                 }.contentShape(Rectangle())
            }


        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
    func getDateString(entry: JournalEntry) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: entry.date ?? Date())
    }
}
struct ListRowModifer: ViewModifier
{
    func body(content: Content) -> some View
    {
        Group
        {
            content
//            Divider()
        }//.offset(x: 20)
    }
}
struct MoodIcon: View
{
    let entry: JournalEntry
    
    var body: some View
    {
        VStack
        {
            if entry.mood == 1
            {
                Image("Awful")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(Color("MyRed"))
            }
            else if entry.mood == 2
            {
                Image("Bad")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(Color("MyOrange"))
            }
            else if entry.mood == 3
            {
                Image("Ok")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(Color("MyYellow"))
            }
            else if entry.mood == 4
            {
                Image("Good")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(Color("MyYellowGreen"))
            }
            else if entry.mood == 5
            {
                Image("Great")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(Color("MyGreen"))
            }

        }
    }
}
