import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        
        var newArray: [Int] = []
        var anotherArray: [Int] = []
        var biggestProfit = -1000000
        var biggestProfit2 = -1000000
        var diff = 0
        var diff2 = 0
        
        if prices.count < 1 {
            return 0
        }
        
        for i in 0..<prices.count {
            
            newArray.append(prices[i])
            
            var sum = 0
            var sum2 = 0
            
            if i >= 0 && i < newArray.count {
                
                for j in 0..<newArray.count {
                    
                    diff = newArray.last! - newArray[j]
                    
                    if diff > 0 {
                        sum += diff
                    }
                    
                    if diff < 0 {
                        
                        anotherArray.append(newArray.last!)
                        
                        for x in 0..<anotherArray.count {
                            
                            diff2 = anotherArray.last! - anotherArray[x]
                            
                            if diff2 > biggestProfit2 {
                                biggestProfit2 = diff2
                            }
                        }
                        
                        sum2 += diff2
                        
                    }
                    if sum > biggestProfit && sum2 > biggestProfit2 {
                        biggestProfit = sum + sum2
                    }
                }
            }
        }
        return biggestProfit
    }
}
