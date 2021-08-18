//
//  GameViewController.swift
//  FindNumber
//
//  Created by perpointt on 18.08.2021.
//

import UIKit

class GameViewController: UIViewController {
    
   lazy var game = Game(counItems: buttons.count)

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var nextDigit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        guard let buttonIndex = buttons.firstIndex(of: sender) else { return }
        game.check(index: buttonIndex)
        
        updateUI()
    }
    
    private func setupScreen(){
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
        }
        nextDigit.text = game.nextItem?.title
    }
    
    
    private func updateUI(){
        for index in game.items.indices{
            buttons[index].isHidden = game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.title
    }
    
   

}
