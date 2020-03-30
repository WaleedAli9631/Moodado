//
//  ColorSwitcher.swift
//  JournalApp
//
//  Created by CSUFTitan on 3/8/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI

struct ActivitiesDisplayer: View {

    var entry: JournalEntry
    
    var body: some View {
        VStack
        {
            Divider()
            HStack
            {
                    if ActivitiesDisplayer.getActivites(entry: entry, activity: "exercise")
                        {
                            VStack
                            {
                                Image("exercise")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .modifier(PrimaryLabel(color: Color("BackForward")))
                               // Text("Exercised")
                            }

                        }
                        if ActivitiesDisplayer.getActivites(entry: entry, activity: "relax")
                        {
                            VStack
                            {
                                Image("relax")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .modifier(PrimaryLabel(color: Color("BackForward")))
                                //Text("Relaxed")
                            }

                        }
                        if ActivitiesDisplayer.getActivites(entry: entry, activity: "reading")
                        {
                            VStack
                            {
                                Image("read")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .modifier(PrimaryLabel(color: Color("BackForward")))

                               // Text("Read")
                            }

                        }
                if ActivitiesDisplayer.getActivites(entry: entry, activity: "tv")
                {
                    VStack
                    {
                        Image("tv")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .modifier(PrimaryLabel(color: Color("BackForward")))

                        //Text("Read")
                    }

                }
                if ActivitiesDisplayer.getActivites(entry: entry, activity: "gaming")
                {
                    VStack
                    {
                        Image("gaming")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .modifier(PrimaryLabel(color: Color("BackForward")))

                        //Text("Read")
                    }

                }


                    
            }//HStack 1
            
            Divider()
            
            HStack
            {
                if ActivitiesDisplayer.getActivites(entry: entry, activity: "friends")
                {
                    VStack
                    {
                        Image("friends")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .modifier(PrimaryLabel(color: Color("BackForward")))

                       // Text("Read")
                    }

                }
                if ActivitiesDisplayer.getActivites(entry: entry, activity: "family")
                {
                    VStack
                    {
                        Image("family")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .modifier(PrimaryLabel(color: Color("BackForward")))

                       // Text("Read")
                    }

                }
                    if ActivitiesDisplayer.getActivites(entry: entry, activity: "goOut")
                    {
                        VStack
                        {
                            Image("goOut")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(PrimaryLabel(color: Color("BackForward")))

                            //Text("Read")
                        }

                    }
                    if ActivitiesDisplayer.getActivites(entry: entry, activity: "relationship")
                    {
                        VStack
                        {
                            Image("relationship")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(PrimaryLabel(color: Color("BackForward")))

                            //Text("Read")
                        }

                    }
                    if ActivitiesDisplayer.getActivites(entry: entry, activity: "sport")
                    {
                        VStack
                        {
                            Image("sport")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(PrimaryLabel(color: Color("BackForward")))

                            //Text("Read")
                        }

                    }

            }// HStack 2
            Divider()
            
            HStack
            {
                    if ActivitiesDisplayer.getActivites(entry: entry, activity: "eatBad")
                    {
                        VStack
                        {
                            Image("eatBad")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(PrimaryLabel(color: Color("BackForward")))

                            //Text("Read")
                        }

                    }
                    if ActivitiesDisplayer.getActivites(entry: entry, activity: "eatWell")
                    {
                        VStack
                        {
                            Image("eatWell")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(PrimaryLabel(color: Color("BackForward")))

                            //Text("Read")
                        }

                    }


                    if ActivitiesDisplayer.getActivites(entry: entry, activity: "sleepWell")
                    {
                        VStack
                        {
                            Image("sleepWell")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(PrimaryLabel(color: Color("BackForward")))

                            //Text("Read")
                        }

                    }
                    if ActivitiesDisplayer.getActivites(entry: entry, activity: "sleepBad")
                    {
                        VStack
                        {
                            Image("sleepBad")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .modifier(PrimaryLabel(color: Color("BackForward")))

                            //Text("Read")
                        }

                    }

            }// Hstack 3
            Divider()
            HStack
            {
                if ActivitiesDisplayer.getActivites(entry: entry, activity: "school")
                {
                    VStack
                    {
                        Image("school")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .modifier(PrimaryLabel(color: Color("BackForward")))

                        //Text("Read")
                    }

                }
                if ActivitiesDisplayer.getActivites(entry: entry, activity: "work")
                {
                    VStack
                    {
                        Image("work")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .modifier(PrimaryLabel(color: Color("BackForward")))

                        //Text("Read")
                    }

                }


            }// HStack 4
            
            Divider()

            
            
            
        }
    }
    
    
    public static func getActivites(entry: JournalEntry, activity: String) -> Bool
    {
        if activity == "exercise"
        {

            
                if entry.exercise == true
                {
                    return true
                }
                else
                {
                    return false
                }
            
        }
        else if activity == "reading"
        {

                if entry.reading == true
                {
                    return true
                }
                else
                {
                    return false
                }
            
        }
        else if activity == "relax"
        {

  
                if entry.relax == true
                {
                    return true
                }
                else
                {
                    return false
                }
            
        }
        else if activity == "goOut"
          {


                  if entry.goOut == true
                  {
                      return true
                  }
                  else
                  {
                      return false
                  }
              
          }
        else if activity == "family"
          {

    
                  if entry.family == true
                  {
                      return true
                  }
                  else
                  {
                      return false
                  }
              
          }
        else if activity == "friends"
          {

    
                  if entry.friends == true
                  {
                      return true
                  }
                  else
                  {
                      return false
                  }
              
          }
            else if activity == "gaming"
              {

        
                      if entry.gaming == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "tv"
              {

        
                      if entry.tv == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "relationship"
              {

        
                      if entry.relationship == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "sport"
              {

        
                      if entry.sport == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "eatWell"
              {

        
                      if entry.eatWell == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "eatBad"
              {

        
                      if entry.eatBad == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "sleepWell"
              {

        
                      if entry.sleepWell == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "sleepBad"
              {

        
                      if entry.sleepBad == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "school"
              {

        
                      if entry.school == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
            else if activity == "work"
              {

        
                      if entry.work == true
                      {
                          return true
                      }
                      else
                      {
                          return false
                      }
                  
              }
        
        
        
    
        return false
        
    }
}



struct PrimaryLabel: ViewModifier {
    var color = Color("MyRed")
    func body(content: Content) -> some View {
        content
            .frame(width: 45, height: 45)
            .foregroundColor(color)
    }
}
