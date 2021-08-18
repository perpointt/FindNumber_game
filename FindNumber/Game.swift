//
//  Game.swift
//  FindNumber
//
//  Created by perpointt on 18.08.2021.
//

import Foundation

enum StatusGame{
    case start
    case win
}


class Game {
    
    struct Item {
        var title:String
        var isFound:Bool = false
    }
    
    private let data = Array(1...99)
    
    var items:[Item] = []
    
    private var counItems:Int
    
    var nextItem:Item?
    
    var status:StatusGame = .start
    
     init(counItems:Int){
        self.counItems = counItems
        setupGame()
    }
    
    private func setupGame(){
        var digits = data.shuffled()
        
        while items.count < counItems {
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }
        nextItem = items.shuffled().first
    }
    
    func check(index:Int){
        if items[index].title==nextItem?.title{
            items[index].isFound = true
            nextItem = items.shuffled().first(where: {(item)-> Bool in item.isFound == false})
        }
        
        if nextItem == nil {
            status = .win
        }
    }
    
}
