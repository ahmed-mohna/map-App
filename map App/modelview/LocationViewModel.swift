//
//  LocationViewModel.swift
//  map App
//
//  Created by Ahmed Mohna on 04/08/2022.
//

import Foundation
import MapKit
import SwiftUI


class LocatinViewModel : ObservableObject {
    
    @Published var loactions : [ Location]
    @Published var mapLocation : Location {
        didSet{
            withAnimation() {
                updateMapRegion(location: mapLocation)

            }
        }
    }
    @Published var sheetViewLocation : Location? = nil
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    @Published var IsMenuOpen : Bool = false
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init (){
        let locations = LocationsDataService.locations
        self.loactions = locations
        self.mapLocation = locations.first!
        updateMapRegion(location: self.mapLocation)
        
        
    }
    func toggleMenuState (){
        withAnimation {
            IsMenuOpen.toggle()
        }
    }
    
    private func updateMapRegion(location:Location){
        
        withAnimation {
            IsMenuOpen=false
            mapRegion=MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
        
    }
    
    func goToselectedview(newLoaction:Location){
        self.mapLocation=newLoaction
        
    }
    
    func goToNextView(){
        
        let firstIndex = loactions.firstIndex { loc in
            return loc.id == mapLocation.id
        }
        guard let CurrentIndex = firstIndex  else {
            return
        }
      
        guard loactions.indices.contains(CurrentIndex + 1) else {
            
            
            mapLocation=loactions.first!
            
            return
            
        }
        mapLocation=loactions[CurrentIndex+1]
        
    }
    
}
