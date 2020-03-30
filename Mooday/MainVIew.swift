//
//  MainVIew.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/3/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI


struct MainView: View
{
    @EnvironmentObject var user: User
    @Environment(\.managedObjectContext) var managedObjectContext

    var geometry: GeometryProxy


    var body: some View
    {
        VStack
        {
            if self.user.Location == User.Locations.ListView
            {
                ListView(monthFilter: self.user.monthFilter, yearFilter: self.user.yearFilter, geometry: geometry)
            }
            else if self.user.Location == User.Locations.StatsView
            {
                StatsView(monthFilter: self.user.monthFilter, yearFilter: self.user.yearFilter, geometry: geometry)

            }
            else if self.user.Location == User.Locations.EntryView
            {
                EntryView(geometry: geometry)
            }
            
        }.background(Color("MyGray"))
    }
}
