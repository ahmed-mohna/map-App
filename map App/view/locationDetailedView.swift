//
//  locationDetailedView.swift
//  map App
//
//  Created by Ahmed Mohna on 06/08/2022.
//

import SwiftUI
import MapKit

struct locationDetailedView: View {
    // property
    let location : Location
    @EnvironmentObject var vm : LocatinViewModel

    
    
    // bod
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,spacing: 0){
                TabView {
                    ForEach(location.imageNames,id: \.self){
                        
                        Image($0)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.8, alignment: .center)
                            .clipped()
                        // add clipped to clipp the image that has bigger size 
                        
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.8)
                .tabViewStyle(PageTabViewStyle())
              
                
                Text(location.name)
                    .font(.system(size: 26, weight: .bold, design: .serif))
                    .padding(.leading)
                    .padding(.top,9)
                    .shadow(color: .gray, radius: 12, x: 5, y: 5)
                
                Text(location.cityName)
                    .font(.system(size: 23, weight: .semibold, design: .serif))
                    .foregroundColor(.secondary)
                    .padding(.leading)
                    .padding(.top,5)
                    .shadow(color: .gray, radius: 12, x: 5, y: 5)
                    
                Text(location.description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top,5)
                    
                Divider().padding()
                if let url = URL(string: location.link){
                Link(destination: url ) {
                    
                    Text("Read More About "+"\(location.name)")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
              
                    
                    
                    
                }
                    
                  
             }
                
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))) , annotationItems: [location]) { loc in
                    MapAnnotation(coordinate: location.coordinates) {
                        mapAnnotation()
                    }
                }
                .padding()
               
                .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                .cornerRadius(80)
                .padding(.bottom,40)
                .allowsTightening(true)
                
                
                
            }
        }
        .ignoresSafeArea()
        .overlay(
            Button(action: {
                vm.sheetViewLocation=nil
            }, label: {
            Image(systemName: "xmark.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding(.leading,25)
                    .padding(.top,40)
            })
            ,alignment: .topLeading
            
        ).ignoresSafeArea()
        

    }
}

struct locationDetailedView_Previews: PreviewProvider {
   static let vm = LocatinViewModel()
    static var previews: some View {
        locationDetailedView( location: vm.loactions[0])
            .environmentObject(LocatinViewModel())
    }
}
