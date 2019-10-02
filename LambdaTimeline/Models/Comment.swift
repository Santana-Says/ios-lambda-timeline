//
//  Comment.swift
//  LambdaTimeline
//
//  Created by Spencer Curtis on 10/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import FirebaseAuth

class Comment: FirebaseConvertible, Equatable {
    
    static private let textKey = "text"
    static private let author = "author"
	static private let audioURLKey = "audioURL"
    static private let timestampKey = "timestamp"
    
    let text: String?
    let author: Author
	let audioURL: URL?
    let timestamp: Date
    
	init(text: String?, author: Author, audioURL: URL?, timestamp: Date = Date()) {
        self.text = text
        self.author = author
		self.audioURL = audioURL
        self.timestamp = timestamp
    }
    
    init?(dictionary: [String : Any]) {
        guard let authorDictionary = dictionary[Comment.author] as? [String: Any],
            let author = Author(dictionary: authorDictionary),
            let timestampTimeInterval = dictionary[Comment.timestampKey] as? TimeInterval else { return nil }
		let text = dictionary[Comment.textKey] as? String
		let audioPath = dictionary[Comment.audioURLKey] as? URL
        
        self.text = text
        self.author = author
		self.audioURL = audioPath
        self.timestamp = Date(timeIntervalSince1970: timestampTimeInterval)
    }
    
    var dictionaryRepresentation: [String: Any] {
		return [Comment.textKey: text as Any,
                Comment.author: author.dictionaryRepresentation,
				Comment.audioURLKey: audioURL?.absoluteString as Any,
                Comment.timestampKey: timestamp.timeIntervalSince1970]
    }
    
    static func ==(lhs: Comment, rhs: Comment) -> Bool {
        return lhs.author == rhs.author &&
            lhs.timestamp == rhs.timestamp
    }
}
