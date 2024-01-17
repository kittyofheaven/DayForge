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
        self._journals = FirestoreQuery(collectionPath: "users/\(userId)/journals", predicates: [.orderBy("updated", true)])
        
//        viewModel.fetchData()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("JournalBgColor")
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    Image("JournalBg")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFit()
                }

                
                ScrollView {
                        VStack {
                            ForEach(journals) { journal in
                                Button(action: {
                                    viewModel.editedJournalId = journal.id
                                    viewModel.editedTitle = journal.title
                                    viewModel.editedContent = journal.content
                                    viewModel.editTimeSince1970 = journal.updated
                                    viewModel.showingEditJournalView = true
                                }, label: {
                                    
                                    JournalItemView(item: journal)
                                        .padding(.top)
                                        .swipeActions {
                                            Button(action: {
                                                
                                            }, label: {
                                                
                                            })
                                        }
                                    
                                })
                                
                                
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
                .sheet(isPresented: $viewModel.showingEditJournalView, content: {
                    EditJournalView(editJournalPresented: $viewModel.showingEditJournalView, journalViewModel: viewModel)
                })
                .toolbarBackground(Color("JournalBgColor"))
                
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
//    @AppStorage("uid") var userID: String = ""
    JournalView(userId: "t1mRTcYPVWbf7do28TQLGN8gFEG2")
//    JournalView(userId: "DiSGTrObVAawouloexPRFwTaFNW2")
}
