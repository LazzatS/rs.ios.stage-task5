import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        var counter = 0
        var substr = ""
        var secretWord = ""
        
        var decryptedMessage = ""
        var repetitions: Int?
        
        let letters = message.map { String($0) }

        for i in letters {
            
            // MARK: find number of secret words
            if let intLetter = Int(i) {
                if counter >= 1 {
                    substr += i
                    continue
                }
                
                repetitions = intLetter
                
                continue
            }

            // MARK: letters analysis
            if i == "[" {
                counter += 1
                if counter > 1 {
                    substr += i
                }
            } else if i == "]" {
                counter -= 1
                if counter == 0 {
                    
                    secretWord = decryptMessage(substr)
                    substr = ""
                    if var currentRepetition = repetitions {
                        while currentRepetition > 0 {
                            currentRepetition -= 1
                            decryptedMessage += secretWord
                        }
                        repetitions = nil
                    } else {
                        decryptedMessage += secretWord
                    }
                } else {
                    substr += "]"
                }
            } else {
                if counter == 0 {
                    decryptedMessage += i
                } else {
                    substr += i
                }
            }
        }

        return decryptedMessage
    }
}
