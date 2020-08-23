//
//  SFSymbolsView.swift
//  SwiftUI Kit
//
//  Created by Thomas Braun on 8/13/20.
//

import SwiftUI
#if os(iOS)
struct SFSymbolsView: View {
    
    @State private var multicolored = true
    private var selectedCategory: [String] {
        categories[selected]
    }
    private var selectedCategoryName: String {
        categoryNames[selected]
    }
    @State private var selected = 0
    
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
        //        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Menu {
                ScrollView {
                    Group {
                        Button( categoryName(0), action: { selected = 0 })
                        Button( categoryName(1), action: { selected = 1 })
                        Button( categoryName(2), action: { selected = 2 })
                        Button( categoryName(3), action: { selected = 3 })
                        Button( categoryName(4), action: { selected = 4 })
                        Button( categoryName(5), action: { selected = 5 })
                        Button( categoryName(6), action: { selected = 6 })
                        Button( categoryName(7), action: { selected = 7 })
                        Button( categoryName(8), action: { selected = 8 })
                        Button( categoryName(9), action: { selected = 9 })
                    }
                    Group {
                        
                        Button( categoryName(10), action: { selected = 10 })
                        Button( categoryName(11), action: { selected = 11 })
                        Button( categoryName(12), action: { selected = 12 })
                        Button( categoryName(13), action: { selected = 13 })
                        Button( categoryName(14), action: { selected = 14 })
                        Button( categoryName(15), action: { selected = 15 })
                        Button( categoryName(16), action: { selected = 16 })
                        Button( categoryName(17), action: { selected = 17 })
                        Button( categoryName(18), action: { selected = 18 })
                    }
                }.padding()
                
            } label: {
                Image(systemName: selectedCategoryName)
                Text(selectedCategoryName)
            }
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(selectedCategory, id: \.self) { symbol in
                        symbolMaker(symbol: symbol)
                            .symbolView()
                    }
                } .padding()
            }
            Button(action: { multicolored.toggle() }) {
                Text("Toggle Multicolored")
            }
        }.padding()
    }
    
    @ViewBuilder
    func symbolMaker(symbol: String) -> some View {
        VStack {
            Group {
                if multicolored {
                    Image(systemName: symbol)
                        .renderingMode(.original)
                } else {
                    Image(systemName: symbol)
                }
            } .font(.largeTitle)
            Text(symbol)
                .font(.callout)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
    }
    
    func categoryName(_ selected: Int) -> String { categoryNames[selected] }
}


struct SymbolView: ViewModifier {
    
    //    @ViewBuilder
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.blue)
                .opacity(opacityModifier)
                //                .border(Color.secondary, width: 1)
                .aspectRatio(1, contentMode: .fit)
            content
                .padding()
        }
    }
    
    let cornerRadius: CGFloat = 15.0
    let opacityModifier: Double = 0.05
    
}


extension View {
    func symbolView() -> some View {
        modifier(SymbolView())
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsView()
    }
}
#endif
