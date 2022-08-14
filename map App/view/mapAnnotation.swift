//
//  mapAnnotation.swift
//  map App
//
//  Created by Ahmed Mohna on 06/08/2022.
//

import SwiftUI

struct mapAnnotation: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0.0){
            Image(systemName: "leaf.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-11.9)
                .padding(.bottom,35)

        }
        
        
    }
}

struct mapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        mapAnnotation()
    }
}
