//
//  ContentView.swift
//  MediTrack1
//
//  Created by Scholar on 6/10/25.
//

import SwiftUI

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
                        }
                        //end vstack
                        .padding(.trailing, 10.0)
                    }
                    //end hstack
                    Image("logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                    
                    NavigationLink(destination: MedicationLog()) {
                        Text("Medication Log 📈")
                            .padding()
                            .background(Color("lightPink"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    //ends nav link
                    
                    NavigationLink(destination: MedicationInfo()) {
                        Text("Medication Information!")
                            .padding()
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
