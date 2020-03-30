//
//  TopView.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/3/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI


struct TopView: View
{
    @EnvironmentObject var user: User
    var geometry: GeometryProxy

    var body: some View
    {
           HStack
               {
                   Text("Back")
                       .isHidden(true)//(self.user.ViewHistory.count <= 1)
                       .onTapGesture
                       {
                           if(self.user.ViewHistory.count > 1)
                           {
                               self.user.ViewHistory.removeLast()
                               self.user.Location = self.user.ViewHistory[self.user.ViewHistory.count - 1]
                            if self.user.Location == User.Locations.EntryView
                            {
                                self.user.topHidden = true
                            }
                            else
                            {
                                self.user.topHidden = false
                            }
                           }
                           else
                           {
                               self.user.Location = User.Locations.ListView
                           }
                   }
                   
                   Spacer()
                if self.user.Location != User.Locations.StatsView
                {
                    
                    Image("Back_Icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                        .frame(width: geometry.size.width/5, height: 75)
                        .foregroundColor(Color("BackForward"))
                        .onTapGesture
                        {
                         self.ChangeMonth(forward: false)
                    }
                    Text("\(self.user.monthFilter)/\(self.user.yearFilter)")
                    
                    Image("Forward_Icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                        .frame(width: geometry.size.width/5, height: 75)
                        .foregroundColor(Color("BackForward"))
                        .onTapGesture
                        {
                         self.ChangeMonth(forward: true)
                         }
                }
                else
                {
                    
                    Text("Statistics")
                }
                   
                   Spacer()
                Text("test").isHidden(true)
                   
           }.frame(width: geometry.size.width, height: 50).background(Color("MyGray"))
        }
    func ChangeMonth(forward: Bool)
    {

        if forward
        {
            if self.user.currentMonth <= self.user.monthFilter && self.user.currentYear <= self.user.yearFilter
            {
                print("OVER CURRENT TIME")
            }
            else
            {
                if self.user.monthFilter + 1 == 13
                {
                    self.user.yearFilter += 1
                    self.user.monthFilter = 1
                }
                else
                {
                    self.user.monthFilter += 1
                }
            }
        }
        else
        {
            if self.user.monthFilter - 1 == 0
            {
                self.user.yearFilter -= 1
                self.user.monthFilter = 12
            }
            else
            {
                self.user.monthFilter -= 1
            }
        }
    }

}
