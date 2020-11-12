//
//  CoffeePicker.swift
//  coffeeCalc
//
//  Created by Ryan Richards on 31/10/2020.
//
// USe this in content view - CoffeePicker(selectedIndex: $selectedIndex)

import SwiftUI

var Categories: [Category] = []
var lastIndex: Int = 0

struct Category: Hashable {
    let id: Int
    var title: String
    var selected: Bool
    
    init (id: Int, title: String, selected: Bool) {
        self.id = id
        self.title = title
        self.selected = selected
    }
}

struct CoffeePicker: View {
    
    @Binding var selectedIndex: Int
    @State private var currentIndex: Int = 0
    @Namespace private var ns
    
    init(selectedIndex: Binding<Int>) {
        _selectedIndex = selectedIndex
        Categories.removeAll()
        Categories.append(Category(id: 0, title: "Atlanta", selected: true))
        Categories.append(Category(id: 1, title: "Las Vegas", selected: false))
        Categories.append(Category(id: 2, title: "Melbourne", selected: false))
        Categories.append(Category(id: 3, title: "Sydney", selected: false))
        Categories.append(Category(id: 4, title: "Dallas", selected: false))
        Categories.append(Category(id: 5, title: "Tel Aviv", selected: false))
        Categories.append(Category(id: 6, title: "New York", selected: false))
        Categories.append(Category(id: 7, title: "Detroit", selected: false))
        Categories.append(Category(id: 8, title: "London", selected: false))
        Categories.append(Category(id: 9, title: "Paris", selected: false))
        Categories.append(Category(id: 10, title: "More Photos", selected: false))
    }
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                ScrollViewReader { scrollView in
                    
                    HStack(spacing: 35) {
                        
                        ForEach(Categories, id: \.self) { item in
                            if item.id == currentIndex {
                                ZStack() {
                                    Text(item.title)
                                        .bold()
                                        .layoutPriority(1)
                                    VStack() {
                                        Rectangle().frame(height: 2)
                                            .padding(.top, 20)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: ns)
                                }
                            } else {
                                Text(item.title)
                                    .onTapGesture {
                                        withAnimation {
                                            currentIndex = item.id
                                            selectedIndex = currentIndex
                                            scrollView.scrollTo(item)
                                        }
                                    }
                            }
                        }
                    }
                    
                    .padding(.trailing, 20)
                }
            }
        }
        .padding()
    }
    
}

struct CoffeePicker_Previews: PreviewProvider {
    static var previews: some View {
        CoffeePicker(selectedIndex: .constant(0))
    }
}
