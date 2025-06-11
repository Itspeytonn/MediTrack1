//
//  MedicationInfo.swift
//  MediTrack1
//
//  Created by Scholar on 6/10/25.
//

import SwiftUI
import SwiftData


struct MedicationInfo: View {
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.lightBlue, location: 0.0),
                    .init(color: Color.lightBlue, location: 0.3),
                    .init(color: Color.theme, location: 1.0)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
                .ignoresSafeArea()
            ScrollView {
                
                VStack {
                    Image("download")
                        .border(Color.lightPink, width: 15)
                        .background(Color("lightPink"))
                    
                    Spacer().frame(height: 150)
                    
                    Text("       Sertraline is a common antidepressant used to treat depression, anxiety, and obsessive-compulsive disorder (OCD). It is also used to treat other mental health conditions such as panic disorder, post-traumatic stress disorder (PTSD), and social anxiety disorder (SAD). Sertraline is also used to treat certain types of cancer.")
                    
                        .font(.custom("Verdana", size: 20))
                        .padding(.all, 17.0)
                        .padding(0.0)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("lightPink"), lineWidth: 10))
                        .cornerRadius(10)
                    
                    Spacer().frame(height: 150)
                    
                    Image("download-1")
                        .border(Color.lightPink, width: 15)
                        .background(Color("lightPink"))
                    
                    Spacer().frame(height: 150)
                    
                    Text("Metoprolol is a medication used to lower blood pressure and heart rate. It is a beta blocker, or medication that blocks the effects of stress hormones. Metoprolol prevents chest pain and further damage after a heart attack.")
                    
                    
                        .font(.custom("Verdana", size: 20))
                        .padding(.all, 17.0)
                        .padding(0.0)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("lightPink"), lineWidth: 10))
                        .cornerRadius(10)
                    
                }//end ZStack
            }//end ScrollView
            }//end VStack
 }//end struct
}//end var

#Preview {
    MedicationInfo()
}
