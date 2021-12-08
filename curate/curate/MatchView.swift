//
//  MatchView.swift
//  curate
//
//  Created by Yash Wani on 12/6/21.
// Search view made by Ananth

import SwiftUI
import GameKit



struct MatchView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    //    @State private var searchCategory: String
    
    let array = ["Shirt1", "Shoe1", "Shoe2", "Shirt2", "Pant1", "Acces1", "Bag1", "Shirt 4", "Pant2", "Shoes3", "Dress1", "Top1"]
    var clothes: [String: [String]] = ["shirt": ["https://m.media-amazon.com/images/G/01/Shopbop/p/prod/products/abohe/abohe300851c3c5/abohe300851c3c5_1638558472585_2-0._UX357_QL90_.jpg", "https://m.media-amazon.com/images/G/01/Shopbop/p/prod/products/tgrea/tgrea309721c5dd/tgrea309721c5dd_1638570252985_2-0._UX357_QL90_.jpg"],
                                       "pants": ["pant"]
    ]
    
    var match: GKMatch
    private var timer: Timer!
    
    @State private var gameModel: GameModel!
    @State private var gridItems1: [String] = ["https://m.media-amazon.com/images/G/01/Shopbop/p/prod/products/abohe/abohe300851c3c5/abohe300851c3c5_1638558472585_2-0._UX357_QL90_.jpg", "https://m.media-amazon.com/images/G/01/Shopbop/p/prod/products/tgrea/tgrea309721c5dd/tgrea309721c5dd_1638570252985_2-0._UX357_QL90_.jpg", "https://m.media-amazon.com/images/G/01/Shopbop/p/prod/products/mnsee/mnsee3038110c4d/mnsee3038110c4d_1638569397702_2-0._UX357_QL90_.jpg"]
//    @State private var gridItems2: [String]

    
    public init(_ match: GKMatch) {
        self.match = match
        //        self.searchCategory = "shirt"
    }
    
    var body: some View {
        GeometryReader { metrics in
            HStack (spacing: 0) {
                VStack {
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            
                            TextField("search", text: $searchText, onEditingChanged: { isEditing in
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
                    }
                    .padding(.horizontal)
                    .navigationBarHidden(showCancelButton)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack (spacing: 16){
                            ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self){
                                searchText in ImageTest(imageURL: searchText)
                            }
                        }
                    }
                    
                }.frame(width: metrics.size.width*0.25).background(Color.teal).ignoresSafeArea(.all).padding(.all)
                VStack (spacing: 5){
                    HStack (spacing: 0){
                        ForEach(0 ..< 3) { item in
                            ImageTest(imageURL: gridItems1[item])
                        }
                    }.padding(.all)
                    HStack (spacing: 15){
                        ForEach(0 ..< 3) { item in
                            CardView()
                        }
                    }
                }.frame(width: metrics.size.width*0.75).background(Color.teal).ignoresSafeArea(.all)
            }.background(Color.teal)
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MatchView(GKMatch())
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
