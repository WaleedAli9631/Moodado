//
//  ContentView.swift
//  Journal
//
//  Created by CSUFTitan on 2/25/20.
//  Copyright © 2020 Waleed Ali. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var user: User
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Day.entity(), sortDescriptors: []) var days: FetchedResults<Day>
    
    
    

    
var body: some View
{
        
GeometryReader
    {geometry in
        
        
        ZStack
        {
                
                VStack
                {
                    
                    TopView(geometry: geometry).isHidden(self.user.topHidden)
                    Spacer()
                    MainView(geometry: geometry)
                    Spacer()
                    TabView(geometry: geometry)
                    
                }
                
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("MyGray"))
        
    }
    
}
    
    struct ContentView_Previews: PreviewProvider
    {
        
        static var previews: some View
        {
            ContentView()
        }
    }
    

}
