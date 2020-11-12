//
//  ContentView.swift
//  coffeeCalc
//
//  Created by Ryan Richards on 11/10/2020.
//

import SwiftUI
import SlidingRuler

struct ContentView: View {
    
    @State private var sliderCoffeeValue: Double = 15
    @State var sliderRatioValue: Double = 16
    @State var sliderWaterValue: Double = 0
    @State private var showingSheet = false
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
        
            Button(action: {
                self.showingSheet.toggle()
            }) {
                Image("spro")
            }
            .sheet(isPresented: $showingSheet) {
                Guide()
            }

        }.padding()
        .frame(minWidth: 0,
        maxWidth: .infinity,
        alignment: .topTrailing)

    VStack (alignment : .leading) {
        
        Text("Coffee")
        .fontWeight(.bold)
        .font(.system(size: 60))
        .padding(.leading, 10)
        .padding(.bottom, -5)
            .padding(.top, -30)
        
        
        Text("\(sliderCoffeeValue, specifier: "%.1f")g")
        .font(.system(size: 45))
        .padding(.leading, 10)
        .padding(.trailing, 10)

        
        SlidingRuler(value: $sliderCoffeeValue,
                     in: 0...1000,
                     step: 1,
                     snap: .half ,
                     tick: .fraction)

        
        Spacer()
                .frame(height: 50)
        Text ("Ratio")
            .fontWeight(.bold)
            .font(.system(size: 60))
            .padding(.leading, 10)
            .padding(.bottom, -5)
        
            Text ("1 :\(sliderRatioValue, specifier:" %.f")")
            .font(.system(size: 45))
            .padding(.leading, 10)
            .padding(.trailing, 10)
        
        SlidingRuler(value: $sliderRatioValue,
                     in: 1...30,
                     step: 1,
                     snap: .unit,
                     tick: .unit)
            
        
        Spacer()
            .frame(height: 50)
        
        VStack (alignment : .leading) {
            
        Text ("Water")
            .fontWeight(.bold)
            .font(.system(size: 60))
            .padding(.leading, 10)
            
    
        Text("\(sliderRatioValue * sliderCoffeeValue, specifier:"%.f")g")
            .font(.system(size: 45))
            .padding(.leading, 10)
            .padding(.bottom, 50)
            
        
   
        }
        
    }.padding()
     .frame(minWidth: 0,
     maxWidth: .infinity,
     minHeight: 0,
     maxHeight: .infinity,
     alignment: .topLeading)
        

}
    
    
struct Guide: View {
        var body: some View {
            VStack (alignment: .leading) {
                Text("Brew Guide")
                    .fontWeight(.bold)
                    .font(.system(size: 60))
                    .padding(.leading,10)
                    .padding(.top,15)
                Text("Input your coffee weight value first, 15g is a great staring point for a one person brew.")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding(.top, 10)
                    .padding(.leading,11)
                Text("A smaller brew ratio increases coffee strength, for pour over start with 1:16")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding(.top, 10)
                    .padding(.leading,11)
                Text("Use filtered water off the boil. Aim for a brew time of 2mins 40secs")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding(.top, 10)
                    .padding(.leading,11)
            }.padding()
            .frame(minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading)
               
            
        }
    

    } 
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            
            
    }
}
    
}
