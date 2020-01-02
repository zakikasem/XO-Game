//
//  ViewController.swift
//  x o project
//
//  Created by zaki kasem on 10/17/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activeplayer = 1 //x
       var gameState = [0, 0, 0, 0 , 0 , 0 , 0 , 0 , 0]
       let winningcombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8 ], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
       var gameisactive  = true
       

    @IBOutlet weak var label: UILabel!
    @IBAction func press(_ sender: AnyObject) {
        if (gameState[sender.tag-1] == 0)
               {
                   gameState[sender.tag-1] = activeplayer
                   if (activeplayer == 1)
                   {
                   sender.setImage(UIImage(named: "x.ping.png"),for:UIControl.State.normal)
                       activeplayer = 2
                   }
                   else
                   {
                       sender.setImage(UIImage(named: "o.ping.jpg"),for:UIControl.State.normal)
                       activeplayer = 1
                   }
               }
               for combination in winningcombination {
                   if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
                   {
                       gameisactive = false
                       if gameState[combination[0]] == 1
                       {
                          
                           label.text = "X HAS WON"
                       }
                       else
                       {
                           
                           label.text = "O HAS WON"
                           
                       }
                    playAgainButton.isHidden = false
                       label.isHidden = false
                   }
           }
               gameisactive = false
           for i in gameState
           {
               if i == 0
               {
                   gameisactive = true
                   break
               }
            }
               if gameisactive == false
               {
                   label.text = "IT WAS A DRAW"
                   label.isHidden = false
                   playAgainButton.isHidden = false
               }
        
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgainButton(_ sender: AnyObject) {
        gameState = [0, 0, 0, 0 , 0 , 0 , 0 , 0 , 0]
               gameisactive = true
               activeplayer = 1
               playAgainButton.isHidden = true
               label.isHidden = true
               label.isHidden = true
               for i in 1...9
               {
                   let button = view.viewWithTag(i) as! UIButton
                   button.setImage(nil, for: UIControl.State())
                   
               }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

