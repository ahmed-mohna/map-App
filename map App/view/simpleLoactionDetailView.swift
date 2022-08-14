//
//  simpleLoactionDetailView.swift
//  map App
//
//  Created by Ahmed Mohna on 05/08/2022.
//

import SwiftUI

struct simpleLoactionDetailView: View {
    @EnvironmentObject var vm : LocatinViewModel

    let location:Location
    var body: some View {

        HStack(alignment:.bottom ,spacing: 0){
            
            VStack {
                Image(location.imageNames.first!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(5)
                    .cornerRadius(19)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
                VStack(alignment:.leading,spacing:0){
                    Text(location.name)
                        .font(.system(size: 19, weight: .semibold, design: .serif))
                        .padding(.leading)
                        .padding(.bottom)
                        .padding(.top,2)
                       
                    Text(location.cityName) .font(.system(size: 20, weight: .heavy, design: .serif))
                        .padding(.leading)
                        .padding(.bottom)
                        .padding(.top,2)
                    
                }.foregroundColor(.black)
            }
               
            Spacer()
            VStack{
                
                Button {
                    vm.sheetViewLocation=location
                    
                } label: {
                    Text("Learn More")
                        .padding(10)
                        .frame(width: 120, height: 40, alignment: .center)
                        .background(.blue)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.vertical,10)
                        
                    
                }.buttonStyle(.plain)

                Button {
                    
                    vm.goToNextView()
                } label: {
                    Text("Next")
                        .padding(10)
                        .frame(width: 120, height: 40, alignment: .center)
                        .background(.blue.opacity(0.8))
                        .cornerRadius(12)
                        
                    
                }.buttonStyle(.plain)
                
            }.padding()
            
            
        }
        .background(
        RoundedRectangle(cornerRadius: 19)
            .fill(.ultraThinMaterial)
            .offset(y:50)
            .cornerRadius(19)
        
        )
        
        
        
    }
}

struct simpleLoactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        simpleLoactionDetailView(location: LocationsDataService.locations.first!)
            .background(.red)
            .environmentObject(LocatinViewModel())
    }
}
