//
//  LocationView.swift
//  map App
//
//  Created by Ahmed Mohna on 04/08/2022.
//

import SwiftUI
import MapKit




struct LocationView: View {
    @EnvironmentObject var vm : LocatinViewModel
    @State var  isMenuOpen:Bool = false
    @State var isSheetOpen:Bool  = false
    
    
    var body: some View {
                ZStack{
                  
                    MapLAyer
                        .ignoresSafeArea()
                    
                    
                    
                        VStack(spacing:0) {
                   
                        header
                            .padding(.horizontal)
                        
                        if vm.IsMenuOpen {
                            
                            menuView()
                                .padding()
                        }
                      
                        Spacer()
                        ZStack {
                            ForEach(vm.loactions){ location in
                                if vm.mapLocation.id == location.id {
                                    
                                simpleLoactionDetailView(location: vm.mapLocation)
                                       
                                .padding()
                                .sheet(item: $vm.sheetViewLocation) { loc in
                                    locationDetailedView(location: loc)
                                }
                                    
                                
                            }
                            
                    }
                    }
                    }
                
                    
                }
               
        }
    }


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocatinViewModel())
    }
}

extension LocationView {
    
    private var  header :  some View {
        VStack{
            Text(vm.mapLocation.name + ",  " + vm.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .padding()
                .animation(.none, value: vm.mapLocation.name)
                .frame( height: 60, alignment: .center)
                .frame(maxWidth:.infinity)
                .background(.ultraThinMaterial)
                .overlay(
                
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            vm.toggleMenuState()
                        }
                        
                    }, label: {
                    
                        Image(systemName:vm.IsMenuOpen ?  "arrow.up" : "arrow.down" )
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .bold, design: .serif))
                            .padding()
                        
                    })
                    
                    ,alignment: .leading )
            
                
                
         
            
            
        }
        .background(.thickMaterial)
        .cornerRadius(12)
     
        
        .shadow(color: .gray, radius: 12, x: 5, y: 5)
        
        
    }

}


extension LocationView {
    
    
    private var MapLAyer : some View {
        
        Map(coordinateRegion: $vm.mapRegion,annotationItems: vm.loactions , annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                mapAnnotation()
                    .foregroundColor(.indigo.opacity(0.9))
                    .scaleEffect(location==vm.mapLocation ? 1 : 0.6).zIndex(1)
                    .onTapGesture {
                        vm.goToselectedview(newLoaction: location)
                    }
                    
            }
        })
    }
    
}
