// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Caml_array from "bs-platform/lib/es6/caml_array.js";

var count = document.getElementById("count");

var plusBtn = document.getElementById("plus-one");

var minusBtn = document.getElementById("minus-one");

var counter = {
  contents: 0
};

function removeLastClass(param) {
  var theClass = Caml_array.get(count.classList, 1);
  return count.classList.remove(theClass);
}

function addClass(className) {
  removeLastClass(undefined);
  return count.classList.add(className);
}

function updateClass(param) {
  var realCount = counter.contents;
  if (realCount > 0) {
    return addClass("count-positive");
  } else if (realCount < 0) {
    return addClass("count-negative");
  } else {
    return addClass("count-zero");
  }
}

function updateCounter(number) {
  counter.contents = counter.contents + number | 0;
  var realCount = counter.contents === 0 ? "zero" : String(counter.contents);
  count.innerText = "Count is " + realCount;
  return updateClass(undefined);
}

function handleEvent(action) {
  if (action) {
    return updateCounter(-1);
  } else {
    return updateCounter(1);
  }
}

plusBtn.addEventListener("click", (function (param) {
        return updateCounter(1);
      }));

minusBtn.addEventListener("click", (function (param) {
        return updateCounter(-1);
      }));

export {
  count ,
  plusBtn ,
  minusBtn ,
  counter ,
  removeLastClass ,
  addClass ,
  updateClass ,
  updateCounter ,
  handleEvent ,
  
}
/* count Not a pure module */
