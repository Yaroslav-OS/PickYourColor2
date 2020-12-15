//
//  SliderView.swift
//  PickYourColor2
//
//  Created by Yaroslav on 14.12.2020.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var sliderValue: Double
    @State var showAlert: Bool = false
    
    let color: Color
    
    var valueString: Binding<String> {
            Binding<String>(
                get: { String(format: "%.0f", Double(sliderValue)) },
                set: {
                    if let value = NumberFormatter().number(from: $0) {
                        let valueDouble = value.doubleValue
                        sliderValue = valueDouble
                    }
                }
            )
        }

    
    var body: some View {
        HStack(spacing: 15) {
            Text("\(lround(sliderValue))")
                .foregroundColor(Color.white)
                .frame(width: 45, alignment: .center)
            Slider(value: $sliderValue, in: 0...255).frame(width: 265)
                .accentColor(color)
            TextField("", text: valueString, onEditingChanged: {_ in
                if sliderValue > 255 {
                    sliderValue = 0
                    showAlert = true
                }
            })
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.blue)
            )
            .multilineTextAlignment(.center)
            .frame(width: 45)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Wrong Number"), message: Text("Your number must be between 0 and 255 inclusive"))
            }
        }
    }
}

struct SliderView_Previews: PreviewProvider {
        
    static var previews: some View {
        SliderView(sliderValue: .constant(50), color: .red)
    }
}
