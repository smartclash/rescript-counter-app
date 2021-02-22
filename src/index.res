@val external document: {..} = "document"

let count = document["getElementById"]("count")
let plusBtn = document["getElementById"]("plus-one")
let minusBtn = document["getElementById"]("minus-one")

type countAction = Increment | Decrement

let removeLastClass = (): unit => {
    let theClass = count["classList"][1]
    count["classList"]["remove"](theClass)
}

let addClass = className => {
    removeLastClass()
    count["classList"]["add"](className)
}

let getCount = () => {
    let theCount = (count["innerText"]->Js.String2.split(" "))[2]
    switch theCount->Belt.Int.fromString {
        | Some(number) => number
        | None => 0
    }
}

let updateClass = (): unit => {
    let realCount = getCount()

    if realCount > 0 {
        addClass("count-positive")
    } else if realCount < 0 {
        addClass("count-negative")
    } else {
        addClass("count-zero")
    }
}

let updateCounter = (number: int) => {
    let newCount = getCount() + number
    let realCount = newCount == 0 ? "zero" : newCount->Belt.Int.toString

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
