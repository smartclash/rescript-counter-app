@val external document: {..} = "document"

let count = document["getElementById"]("count")
let plusBtn = document["getElementById"]("plus-one")
let minusBtn = document["getElementById"]("minus-one")

type countAction = Increment | Decrement

let counter = ref(0)

let removeLastClass = (): unit => {
    let theClass = count["classList"][1]
    count["classList"]["remove"](theClass)
}

let addClass = className => {
    removeLastClass()
    count["classList"]["add"](className)
}

let updateClass = (): unit => {
    let realCount = counter.contents
 
    if realCount > 0 {
        addClass("count-positive")
    } else if realCount < 0 {
        addClass("count-negative")
    } else {
        addClass("count-zero")
    }
}

let updateCounter = (number: int) => {
    counter := counter.contents + number
    let realCount = counter.contents == 0 ? "zero" : counter.contents->Belt.Int.toString

    count["innerText"] = "Count is " ++ realCount
    updateClass()
}

let handleEvent = (action: countAction) => {
    switch action {
        | Increment => updateCounter(1)
        | Decrement => updateCounter(-1)
    }
}

plusBtn["addEventListener"]("click", () => handleEvent(Increment))
minusBtn["addEventListener"]("click", () => handleEvent(Decrement))
