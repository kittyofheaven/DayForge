//
//  PsychologistView.swift
//  DayForge
//
//  Created by Hana Azizah on 17/01/24.
//

import SwiftUI

struct PsychologistView: View {
    @StateObject var viewModel = PsychologistViewModel()
    
    @Binding var newPagePresented: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("JournalBgColor")
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Choose a psychologist")
                                .font(.custom("Poppins-Bold", size:25))
                            Spacer()
                        }
                        HStack {
                            Text("Choose, talk, and schedule with a personal psychologsist!")
                                .font(.custom("Poppins-Regular", size: 17))
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                    .padding()
                    
                    HStack {
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 155, height: 147)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Image("DrModaf")
                                    Text("Dr. Modaf")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Text("Clinical Psychologist")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 12))
                                        Text("9/10")
                                            .font(.custom("Poppins-Regular", size: 12))
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                        }
                        .padding(.trailing, 15)
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 155, height: 147)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Image("DrArjun")
                                    Text("Dr. Arjun")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Text("Clinical Psychologist")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 12))
                                        Text("9/10")
                                            .font(.custom("Poppins-Regular", size: 12))
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 15)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 155, height: 147)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Image("DrGeorge")
                                    Text("Dr. George")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Text("Child Psychologist")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 12))
                                        Text("9/10")
                                            .font(.custom("Poppins-Regular", size: 12))
                                            .foregroundColor(.pink)
                                    }
                                }
                            }

                        }
                        .padding(.trailing, 15)
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 155, height: 147)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Image("DrAndrew")
                                    Text("Dr. Andrew")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Text("Military Psychologist")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 12))
                                        Text("9/10")
                                            .font(.custom("Poppins-Regular", size: 12))
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 15)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 155, height: 147)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Image("DrLaura")
                                    Text("Dr. Laura")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Text("Child Psychologist")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 12))
                                        Text("9/10")
                                            .font(.custom("Poppins-Regular", size: 12))
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                        }
                        .padding(.trailing, 15)
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 155, height: 147)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Image("DrTaylor")
                                    Text("Dr. Taylor")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Text("Forensic Psychologist")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 12))
                                        Text("9/10")
                                            .font(.custom("Poppins-Regular", size: 12))
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 15)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 155, height: 147)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Image("DrHermione")
                                    Text("Dr. Hermione")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Text("Clinical Psychologist")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 12))
                                        Text("9/10")
                                            .font(.custom("Poppins-Regular", size: 12))
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                        }
                        .padding(.trailing, 15)
                        
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 155, height: 147)
                                    .foregroundStyle(.white)
                                
                                VStack {
                                    Image("DrJesslyn")
                                    Text("Dr. Jesslyn")
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.black)
                                    Text("Child Psychologist")
                                        .font(.custom("Poppins-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom)
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.pink)
                                            .font(.system(size: 12))
                                        Text("10/10")
                                            .font(.custom("Poppins-Regular", size: 12))
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                        }
                    }
                    
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            newPagePresented = false
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
                }
                .toolbarBackground(Color("JournalBgColor"))
            }
        }
    }
}

#Preview {
    PsychologistView(newPagePresented: Binding(get:{return true},
                                                set: {_ in
    }))
}
