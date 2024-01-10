//
//  JournalView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI


struct NewJournalView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @StateObject var viewModel = NewJournalViewModel()
    @Binding var newJournalPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    Text(String(viewModel.dateNow)).onReceive(timer, perform: { _ in
                        viewModel.dateNow = Date().formatted(date: .abbreviated, time: .omitted)
                    })
                    
                    Spacer()
                    
                    Text(String(viewModel.timeNow)).onReceive(timer, perform: { _ in
                        viewModel.timeNow = Date().formatted(date: .omitted, time: .shortened)
                    }) // jam input
                }
                .padding()
                
                VStack {
                    TextField("", text: $viewModel.title.maxLength(50), prompt: Text("Enter Title ...")
                        .foregroundColor(.black), axis: .vertical)
                        .font(.custom("Inter-Bold", size: 20))
                        .autocorrectionDisabled()
                    
                    TextField("Enter some text ...", text: $viewModel.content.maxLength(viewModel.maxContentLength), axis: .vertical)
                        .font(.custom("Inter-Regular", size: 16))
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                        
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Text("\(viewModel.content.count)/\(viewModel.maxContentLength)")
                            .font(.custom("Inter-Regular", size: 16))
                            .opacity(viewModel.maxLength() ? 0.3 : 0.9)
                            .foregroundStyle(viewModel.maxLength() ? Color.black : Color.red)
                    }
                }
                .padding()
                
                
                
                Spacer()
                
                
                
            
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        newJournalPresented = false
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
                        viewModel.logJournal()
                        newJournalPresented = false
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



#Preview {
    NewJournalView(newJournalPresented: Binding(get:{return true}, 
                                                set: {_ in
    }))
}
