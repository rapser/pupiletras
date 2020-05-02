//
//  ViewController.swift
//  SearchWord
//
//  Created by miguel tomairo on 5/1/20.
//  Copyright © 2020 rapser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.url(forResource: "capitals", withExtension: "json")!
        
        let contents = try! Data(contentsOf: path)
        let words = try! JSONDecoder().decode([Word].self, from: contents)
        
        let wordSearch = WordSearch()
        wordSearch.words = words
        wordSearch.makeGrid()
        
        
        let output = wordSearch.render()
        let url = getDocumentDirectory().appendingPathComponent("ouput.pdf")
        
        print(url)
        try? output.write(to: url)
    }
    
    func getDocumentDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }


}


