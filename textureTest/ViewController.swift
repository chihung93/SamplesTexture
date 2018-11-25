//
//  ViewController.swift
//  textureTest
//
//  Created by Hung on 11/25/18.
//  Copyright © 2018 Rockship. All rights reserved.
//

import UIKit
import AsyncDisplayKit
class ViewController: ASViewController<ASDisplayNode>{
    var samples = [String]()
    var tableNode: ASTableNode {
        return node as! ASTableNode
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        samples.append("animals")
        samples.append("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        samples.append("Why do we use it?")
        samples.append("Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...")
        samples.append("Donate: If you use this site regularly and would like to help keep the site on the Internet, please consider donating a small sum to help pay for the hosting and bandwidth bill. There is no minimum donation, any sum is appreciated - click here to donate using PayPal. Thank you for your support.")
        
        
        samples.append("Donate: ")
        samples.append(" and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        samples.append(" when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        
        samples.append("Donate: If you use this site regularly and would like to help keep the site on the Internet, please consider donating a small sum to help pay for")
    }
    
    init(){
        super.init(node:ASTableNode())
        tableNode.delegate = self
        tableNode.dataSource = self
        tableNode.view.allowsSelection = false
        tableNode.view.separatorStyle = .none
        tableNode.view.leadingScreensForBatching = 3.0  // default is 2.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}


// MARK: - ASTableDelegate

extension ViewController: ASTableDelegate {
    
    func shouldBatchFetch(for tableNode: ASTableNode) -> Bool {
        return false
    }
}

// MARK: - ASTableDataSource

extension ViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return samples.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let textCellNode = ASTextCellNode()
        textCellNode.text = samples.randomElement()
        return textCellNode
    }
}

