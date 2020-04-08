//
//  ContentView.swift
//  SwiftUI-Day16
//
//  Created by Jeremy Xue on 2020/4/8.
//  Copyright © 2020 Jeremy Xue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Group {
                        Text("Hello, World")
                        Text("Hello, World")
                        Text("Hello, World")
                        Text("Hello, World")
                        Text("Hello, World")
                    }
                    Group {
                        Text("Hello, World")
                        Text("Hello, World")
                        Text("Hello, World")
                        Text("Hello, World")
                        Text("Hello, World")
                        Text("Hello, World")
                    }
                }
                
                Section {
                    Button("Tap Count: \(tapCount)") {
                        self.tapCount += 1
                    }
                }
                
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                
                Section {
                    ForEach(0..<10) {
                        Text("Row \($0)")
                    }
                }
                
                Section {
                    VStack {
                        Picker("Select your student", selection: $selectedStudent) {
                            ForEach(0..<students.count) {
                                Text(self.students[$0])
                            }
                        }
                        Text("You chose: Student # \(students[selectedStudent])")
                    }
                }
            }
            .navigationBarTitle("SwiftUI-Day16")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
