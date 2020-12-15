//
//  MainView.swift
//  PickYourColor2
//
//  Created by Yaroslav on 14.12.2020.
//

import SwiftUI

struct MainView: View {
    
    @State private var valueRed = Double.random(in: 0...255)
    @State private var valueGreen = Double.random(in: 0...255)
    @State private var valueBlue = Double.random(in: 0...255)
    
    private var color: Color {
        Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
    }

    
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            VStack {
                ColorView(color: color)
                SliderView(sliderValue: $valueRed, color: .red)
                SliderView(sliderValue: $valueGreen, color: .green)
                SliderView(sliderValue: $valueBlue, color: .blue)
                Spacer()
            }.padding()
        }
    }
}

struct ColorView: View {
    
    let color: Color
    
    var body: some View {
        color
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 7))
            .padding(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
