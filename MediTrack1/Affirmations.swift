//
//  Affirmations.swift
//  MediTrack1
//
//  Created by Scholar on 6/10/25.
//

import SwiftUI

struct Affirmations: View {
    var body: some View {
        ZStack {
            Color("darkPink")
                .ignoresSafeArea()
            VStack{
                
                    Text("JUNE")
                        .foregroundColor(Color.black)
                        .padding()
                        .font(.custom("Verdana-Bold", size: 24))
                        .padding(.bottom, 4.0)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("theme"), lineWidth: 10))
                        .cornerRadius(10)

               Spacer()
                  .frame(height: 180)
                Text("''You have everything it takes inside you already—so start now, trust your path, and go after your dreams like they were made just for you. Because they were.''")
                    .font(.custom("Verdana", size: 24))
                    .padding(.horizontal, 4.0)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("theme"), lineWidth: 10))
                    .cornerRadius(10)
                
                
                Spacer().frame(height:210)
            }
            //end VStack
            .navigationTitle("Affirmations")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal, 15)
        }//ZStack
                
        }
        //end body
            
    }
    //end struct


#Preview {
    Affirmations()
}
