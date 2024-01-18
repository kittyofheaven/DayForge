//
//  QuizView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI

struct QuizView: View {
    
    @StateObject var viewModel = QuizViewModel()
    
    var body: some View {
        NavigationView {
            HStack {
                ScrollView(showsIndicators: false) {
                    
                    // How are your feelings?
                    VStack {
                        
                        Text("How do you feel today?")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(Color("STitleColor"))
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            
                            Button(action: {
                                withAnimation {
                                    viewModel.animateFrames(0)
                                    viewModel.moodPressed(0)
                                }
                            }, label: {
                                Image("mood0-\(viewModel.currentFrame[0])")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            })
                            
                            Button(action: {
                                withAnimation {
                                    viewModel.animateFrames(1)
                                    viewModel.moodPressed(1)
                                }
                            }, label: {
                                Image("mood1-\(viewModel.currentFrame[1])")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            })
                            
                            Button(action: {
                                withAnimation {
                                    viewModel.animateFrames(2)
                                    viewModel.moodPressed(2)
                                }
                            }, label: {
                                Image("mood2-\(viewModel.currentFrame[2])")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            })
                            
                            Button(action: {
                                withAnimation {
                                    viewModel.animateFrames(3)
                                    viewModel.moodPressed(3)
                                }
                            }, label: {
                                Image("mood3-\(viewModel.currentFrame[3])")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            })
                            
                            Button(action: {
                                withAnimation() {
                                    viewModel.animateFrames(4)
                                    viewModel.moodPressed(4)
                                }
                            }, label: {
                                Image("mood4-\(viewModel.currentFrame[4])")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                            })
                            
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 9)
                    }
                    .padding([.top, .bottom], 3)
                    // How are your feelings?? END
                    
                    // How many cigar did you smoke?
                    VStack {
                        
                        Text("How many cigar did you smoke?")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(Color("STitleColor"))
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            // 0
                            Button(action: {
                                withAnimation {
                                    viewModel.cigarPressed(0)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.cigarButtonClicked[0] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            // 1
                            Button(action: {
                                withAnimation {
                                    viewModel.cigarPressed(1)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.cigarButtonClicked[1] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            // 2
                            Button(action: {
                                withAnimation {
                                    viewModel.cigarPressed(2)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.cigarButtonClicked[2] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //3
                            Button(action: {
                                withAnimation {
                                    viewModel.cigarPressed(3)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.cigarButtonClicked[3] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //4
                            Button(action: {
                                withAnimation {
                                    viewModel.cigarPressed(4)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.cigarButtonClicked[4] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //5
                            Button(action: {
                                withAnimation {
                                    viewModel.cigarPressed(5)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.cigarButtonClicked[5] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 9)
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(Color("MoodQuestionBgColor"))
                        }
                    
                        HStack(spacing: 45){
                            Text("0")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("1")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("2")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("3")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("4")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("≤")
                                .font(.custom("Poppins-Bold", size: 20))
                        }
                    }
                    .padding([.top, .bottom], 3)
                    // How many cigar did you smoke? END
                        
                    // How many alcohol did you drink today
                    VStack {
                        
                        Text("How many alcohol did you drink?")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(Color("STitleColor"))
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            // 0
                            Button(action: {
                                withAnimation {
                                    viewModel.alcoholPressed(0)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.alcoholButtonClicked[0] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            // 1
                            Button(action: {
                                withAnimation {
                                    viewModel.alcoholPressed(1)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.alcoholButtonClicked[1] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            // 2
                            Button(action: {
                                withAnimation {
                                    viewModel.alcoholPressed(2)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.alcoholButtonClicked[2] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //3
                            Button(action: {
                                withAnimation {
                                    viewModel.alcoholPressed(3)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.alcoholButtonClicked[3] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //4
                            Button(action: {
                                withAnimation {
                                    viewModel.alcoholPressed(4)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.alcoholButtonClicked[4] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //5
                            Button(action: {
                                withAnimation {
                                    viewModel.alcoholPressed(5)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.alcoholButtonClicked[5] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 9)
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(Color("MoodQuestionBgColor"))
                        }
                    
                        HStack(spacing: 45){
                            Text("0")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("1")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("2")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("3")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("4")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("≤")
                                .font(.custom("Poppins-Bold", size: 20))
                        }
                    }
                    .padding([.top, .bottom], 3)
                    // How many your drink today? END
                    
                    // How many selfharm did you do?
                    VStack {
                        
                        Text("How many selfharm did you do?")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(Color("STitleColor"))
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            // 0
                            Button(action: {
                                withAnimation {
                                    viewModel.selfharmPressed(0)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.selfharmButtonClicked[0] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            // 1
                            Button(action: {
                                withAnimation {
                                    viewModel.selfharmPressed(1)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.selfharmButtonClicked[1] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            // 2
                            Button(action: {
                                withAnimation {
                                    viewModel.selfharmPressed(2)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.selfharmButtonClicked[2] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //3
                            Button(action: {
                                withAnimation {
                                    viewModel.selfharmPressed(3)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.selfharmButtonClicked[3] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //4
                            Button(action: {
                                withAnimation {
                                    viewModel.selfharmPressed(4)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.selfharmButtonClicked[4] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                            
                            //5
                            Button(action: {
                                withAnimation {
                                    viewModel.selfharmPressed(5)
                                }
                            }, label: {
                                Circle()
                                    .foregroundStyle(viewModel.selfharmButtonClicked[5] ? Color("MoodQuestionPressedColor") : Color("MoodQuestionNotHoverColor"))
                                    .shadow(radius: 3, x: 0, y: 5)
                            })
                        }
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 9)
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(Color("MoodQuestionBgColor"))
                        }
                    
                        HStack(spacing: 45){
                            Text("0")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("1")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("2")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("3")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("4")
                                .font(.custom("Poppins-Bold", size: 20))
                            Text("≤")
                                .font(.custom("Poppins-Bold", size: 20))
                        }
                    }
                    .padding([.top, .bottom], 3)
                    // How many selfharm did you do? END
                    
                    VStack {
                        HStack{
                            Text(viewModel.errorMsg)
                                .padding(.leading)
                                .font(.custom("Poppins-Regular", size: 16))
                            Spacer()
                        }
                        
                        Button(action: {
                            withAnimation {
                                viewModel.logMood()
                            }
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(height: 50)
                                    .foregroundStyle(Color("MoodQuestionHoverColor"))
                                
                                Text("Log Mood")
                                    .font(.custom("Poppins-Regular", size: 17))
                                    .foregroundStyle(Color.black)
                            }
                        })
                    }
                    .padding(.top, 25)
                    .padding(.bottom)
                    .shadow(radius: 3)
                    
                    
                    Spacer()
                }
                
            }
            .padding()
            .navigationTitle("Today's Mood Journal")
        }
    }
}

#Preview {
    QuizView()
}
