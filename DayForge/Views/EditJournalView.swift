//
//  EditJournalView.swift
//  DayForge
//
//  Created by Hana Azizah on 11/01/24.
//

import SwiftUI

struct EditJournalView: View {
    @Binding var editJournalPresented: Bool
    @ObservedObject var journalViewModel: JournalViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    Text(journalViewModel.unixToDate())
                    
                    Spacer()
                    
                    Text(journalViewModel.unixToTime())
                }
                .padding()
                
                VStack {
                    TextField("Edit Title ...", text: $journalViewModel.editedTitle.maxLength(50), prompt: Text("Edit Title ...")
                        .foregroundColor(.black), axis: .vertical)
                        .font(.custom("Inter-Bold", size: 20))
                        .autocorrectionDisabled()
                    
                    TextField("Edit some text ...", text: $journalViewModel.editedContent.maxLength(journalViewModel.maxContentLength), axis: .vertical)
                        .font(.custom("Inter-Regular", size: 16))
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                        
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("\(journalViewModel.editedContent.count)/\(journalViewModel.maxContentLength)")
                            .font(.custom("Inter-Regular", size: 16))
                            .opacity(journalViewModel.maxLength() ? 0.3 : 0.9)
                            .foregroundStyle(journalViewModel.maxLength() ? Color.black : Color.red)
                    }
                }
                .padding()
                
                
                
                Spacer()
                
                
                
            
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        editJournalPresented = false
                    } label: {
                        HStack {
                            Image("backArrow")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("Back")
                                .font(.system(size: 20))
                                .foregroundStyle(Color.black)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        journalViewModel.updateJournal()
                        editJournalPresented = false
                    } label: {
                        Text("Save")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.black)
                    }
                }
            }
        }
    }
}

//#Preview {
//    EditJournalView(editJournalPresented: Binding(get:{return true},set: {_ in
//    }), journalViewModel: JournalViewModel())
//}
