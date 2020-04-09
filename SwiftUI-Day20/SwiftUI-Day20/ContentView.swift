//
//  ContentView.swift
//  SwiftUI-Day20
//
//  Created by Jeremy Xue on 2020/4/9.
//  Copyright © 2020 Jeremy Xue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                ForEach(0..<3) { _ in
                    VStack(spacing: 10) {
                        Text("😈")
                        Text("😈")
                        Text("😈")
                    }
                }
            }
            
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                Text("Your content")
            }
            
            LinearGradient(gradient: Gradient(colors: [.white, .black]),
                           startPoint: .top,
                           endPoint: .bottom)
            
            RadialGradient(gradient: Gradient(colors: [.blue, .black]),
                           center: .center,
                           startRadius: 20,
                           endRadius: 200)
            
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]),
                            center: .center)
            
            VStack {
                Button("Show Alert") {
                    self.showingAlert = true
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Hello SwiftUI!"),
                    message: Text("This is some detail message"),
                    dismissButton: .default(Text("OK")))
                }
                
                Button(action: {
                    print("Edit button was tapped")
                }) {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
