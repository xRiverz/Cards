import UIKit

struct Card{
    var color : String
    var roll : Int
    
    init(color : String){
        self.color = color
        if color == "Blue" {
            roll = [1,2].randomElement()!
        }else if color == "Red" {
            roll = [3,4].randomElement()!
        }else {
            roll = [4,5,6].randomElement()!
        }
    }
}

class Deck{
    var cards : [Card] = []
    
    init(){
        for _ in 0...9{
            cards.append(Card(color: "Red"))
            cards.append(Card(color: "Green"))
            cards.append(Card(color: "Blue"))
        }
        cards.shuffle()
    }
    
    func deal() -> Card{
        return cards.removeFirst()
    }
    
    func isEmpty() -> Bool {
        return cards.isEmpty
    }
    
    func shuffle(){
        self.cards.shuffle()
    }
}

class Player{
    var name: String
    var hand: [Card]
    
    init(name:String){
        self.name = name
        self.hand = []
    }
    
    func draw(deck:Deck) -> Card {
        let card = deck.deal()
        hand.append(card)
        return card
    }
    
    func rollDice() -> Int {
        return [1,2,3,4,5,6].randomElement()!
    }
    
    func matchingCards (color:String,roll:Int) -> Int{
        var counter = 0
        for card in hand{
            if card.color == color && card.roll == roll{
                counter = counter + 1
            }
        }
        return counter
    }
}
