//
//  Book.swift
//  KeyedArchiver
//
//  Created by shivendra pandey on 23/12/20.
//  Copyright © 2020 shivendra pandey. All rights reserved.
//

import Foundation

class Book: NSObject, NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: "title")
        coder.encode(author, forKey: "author")
        coder.encode(published, forKey: "published")
    }
    
    required convenience init?(coder: NSCoder) {
        guard let title = coder.decodeObject(forKey: "title") as? String,
              let author = coder.decodeObject(forKey: "author") as? String
        else { return nil }

        self.init(
            title: title,
            author: author,
            published: coder.decodeInteger(forKey: "published")
        )
    }
    
    var title:String
    var author:String
    var published:Int

    init(title: String, author: String, published: Int) {
        self.title = title
        self.author = author
        self.published = published
    }
}
