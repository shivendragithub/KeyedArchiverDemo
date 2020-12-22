//
//  ViewController.swift
//  KeyedArchiver
//
//  Created by shivendra pandey on 23/12/20.
//  Copyright © 2020 shivendra pandey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var books : [Book] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        books = [
            Book(title: "Nineteen Eighty-Four: A Novel", author: "George Orwell", published: 1949),
            Book(title: "Brave New World", author: "Aldous Huxley", published: 1932),
            Book(title: "Mona Lisa Overdrive", author: "William Gibson", published: 1988),
            Book(title: "Ready Player One", author: "Ernest Cline", published: 2011),
            Book(title: "Red Rising", author: "Pierce Brown", published: 2014)
        ]
    }
    
    @IBAction func SavingAndArchivingData(_ sender: Any) {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("books")

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: books, requiringSecureCoding: false)
            try data.write(to: path)
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }
    
    @IBAction func LoadingAndUnarchivingData(_ sender: Any){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("books")

        do {
            let data = try Data(contentsOf: path)
            if let books = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Book] {
                for book in books {
                    print("\(book.title) -- \(book.author)")
                }
            }
        } catch {
            print("ERROR: \(error.localizedDescription)")
        }
    }


}

