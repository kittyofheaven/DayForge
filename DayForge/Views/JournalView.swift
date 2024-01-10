//
//  JournalView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct JournalView: View {
    @StateObject var viewModel = JournalViewModel()
    @FirestoreQuery var journals: [Journal]
    
    init(userId: String) {
        self._journals = FirestoreQuery(collectionPath: "users/\(userId)/journals")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("JournalBgColor")
                    .ignoresSafeArea()
                
                ScrollView {
                        VStack {
                            ForEach(journals) { journal in
                                JournalItemView(item: journal)
                                    .padding(.top)
                                    .swipeActions {
                                        Button(action: {
                                            
                                        }, label: {
                                            
                                        })
                                    }
                                
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        // sheet dengan isPresented
                }
                .navigationTitle("Journal")
                .toolbar {
                    Button {
                        viewModel.showingNewJournalView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewJournalView, content: {
                    NewJournalView(newJournalPresented: $viewModel.showingNewJournalView)
                })
                .background {
                    Spacer()
                    Image("JournalBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.bottom)
                        .scaledToFit()
                }
                .toolbarBackground(Color("JournalBgColor"))
                
                
                
            }
        }
    }
}

#Preview {
//    @AppStorage("uid") var userID: String = ""
    JournalView(userId: "t1mRTcYPVWbf7do28TQLGN8gFEG2")
}
