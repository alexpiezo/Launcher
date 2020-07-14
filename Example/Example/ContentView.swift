//
//  ContentView.swift
//  Example
//
//  Created by Oleksandr Izvekov on 14/07/2020.
//  Copyright © 2020 piezo. All rights reserved.
//

import SwiftUI
import Launcher

struct ContentView: View {
    
    @ObservedObject var launcher = Launcher.shared
    
    var body: some View {
        Toggle(isOn: $launcher.isEnabled, label: {
            Text("Launch at Login")
        }).padding(30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
