//
//  SearchView.swift
//  curate
//
//  Created by Ananth Subramanya Mudigere on 12/7/21.
//

import Foundation
import SwiftUI

struct SearchViews: View {
    let array = ["Shirt1", "Shoe1", "Shoe2", "Shirt2", "Pant1", "Acces1", "Bag1", "Shirt 4", "Pant2", "Shoes3", "Dress1", "Top1"]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false

    var body: some View {

        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("go find your fits", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly

                List {
                    // Filtered list of names
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                }
                .navigationBarTitle(Text("Curate Your Fashion"))
                .resignKeyboardOnDragGesture()
            }
        }
    }
}



struct SearchViews_Preview: PreviewProvider {
    static var previews: some View {
        Group {
           SearchViews()
              .environment(\.colorScheme, .light)

           SearchViews()
              .environment(\.colorScheme, .dark)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
        
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
