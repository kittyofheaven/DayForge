//
//  JournalView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Tanggal") // tanggal pake date input
                    Spacer()
                    Text("Jam") // jam input
                }
                .padding()
                    
                Spacer()
                
                Text("Journal")
                // journal
                
                Spacer()
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        // back
                    } label: {
                        Text("< Back")
                            .font(.system(size: 20))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // save
                    } label: {
                        Text("Save")
                            .font(.system(size: 20))
                    }
                }
            }
        }
    }
}

#Preview {
    JournalView()
}
