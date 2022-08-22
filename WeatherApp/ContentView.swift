//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mo Smad on 21/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var currentViewModel = WeatherViewModel()
    
    @State var text = " "
    
    var body: some View {
        VStack{
            
            Text("Okay wait this is a test");
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
