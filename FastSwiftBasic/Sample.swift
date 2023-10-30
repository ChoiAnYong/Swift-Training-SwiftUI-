//
//  Sample.swift
//  FastSwiftBasic
//
//  Created by 최안용 on 10/24/23.
//

import SwiftUI

struct Sample: View {
    
    let data = [
        Destination(direction: .north,
                    food: "파스타맛집",
                    image: Image(systemName: "carrot")),
        Destination(direction: .east,
                    food: nil,
                    image: Image(systemName: "sunrise")),
        Destination(direction: .west,
                    food: nil,
                    image: Image(systemName: "trash")),
        Destination(direction: .south,
                    food: "순대맛집",
                    image: Image(systemName: "fork.knife"))
    ]
    
    @State var selectedDestination: Destination?
    
    var body: some View {
        VStack {
            selectedDestination?.image
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            
            if let destination = selectedDestination {
                Text(destination.direction.rawValue)
                if let food = destination.food {
                    Text(food)
                }
                
            }
            
            Button{
                selectedDestination = data.randomElement()
            } label: {
                Text("돌려요!")
            }
        }
    }
}

struct Destination {
    let direction: Direction
    let food: String?
    let image: Image
     
}

enum Direction: String {
    case north = "북"
    case west = "서"
    case east = "동"
    case south = "남"
}

#Preview {
    Sample()
}

