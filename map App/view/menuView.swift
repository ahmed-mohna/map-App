//
//  menuView.swift
//  map App
//
//  Created by Ahmed Mohna on 05/08/2022.
//

import SwiftUI

struct menuView: View {
    @EnvironmentObject var vm : LocatinViewModel
    
    var body: some View {
    
         List {
            
             ForEach(vm.loactions) { location in
                 HStack {
                     Image(location.imageNames.first!)
                         .resizable()
                         .scaledToFit()
                         .frame(width: 60, height: 65, alignment: .center)
                         .cornerRadius(15)
                     
                     VStack(alignment:.leading) {
                         Text(location.name)
                             .font(.system(size: 23, weight: .semibold, design: .serif))
                         
                         Text(location.cityName)
                             .font(.system(size: 20, weight: .semibold, design: .serif))
                             .padding(5)
                            
                     
                     }
                 }
                 .onTapGesture {
                     vm.goToselectedview(newLoaction: location)
                 }
                     
                     
             }
             
         }.listStyle(PlainListStyle())
                
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
            .environmentObject(LocatinViewModel())
    }
}
