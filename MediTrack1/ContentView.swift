//
//  ContentView.swift
//  MediTrack1
//
//  Created by Scholar on 6/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    HStack{
                        //add setting icon but for now text
                        Text("⚙️")
                            .font(.largeTitle)
                            .padding(.leading, 10.0)
                            
                        Spacer()
                        VStack {
                            Text("🔥")//add streak icon with textbox
                                .font(.largeTitle)
                                

                            Text("streak #")
                            .font(.custom("Verdana-bold", size: 18))                        }
                        //end vstack
                        .padding(.trailing, 10.0)
                    }
                    //end hstack
                    VStack {
                        Image("logo")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding(.all, 25.0)
                    //end vstack
                    .background(Color("lightBlue"))
                    
                    Spacer().frame(height: 25)

                    
                    NavigationLink(destination: MedicationLog()) {
                        Text("Medication Log 📈")
                            .font(.custom("Verdana-bold", size: 18))                            .padding()
                            .background(Color("lightPink"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    //ends nav link
                    
                    Spacer().frame(height: 25)

                    NavigationLink(destination: MedicationInfo()) {
                        Text("Medication Information!")
                            .font(.custom("Verdana-bold", size: 18))                            .padding()
                            .background(Color("lightPink"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    Spacer().frame(height: 25)

                    NavigationLink(destination: Affirmations()) {
                        Text("🤍 Affirmations! 🤍")
                            .font(.custom("Verdana-bold", size: 18))                            .padding()
                            .background(Color("lightPink"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    //ends nav link
                    
                    Spacer()

                }
                //end vstack
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("theme"))

            }
            //end nav stack
        }
        //end Zstack
    }
    //end body
}
//end content view

#Preview {
    ContentView()
}
