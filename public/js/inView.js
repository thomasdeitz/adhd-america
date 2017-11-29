function isScrolledIntoView(el) {
  var elemTop = el.getBoundingClientRect().top;
  var elemBottom = el.getBoundingClientRect().bottom;

  // Only completely visible elements return true:
  var isVisible = (elemTop >= 0) && (elemBottom <= window.innerHeight);
  //var isVisible = (elemTop >= window.innerHeight+50);
  // Partially visible elements return true:
  //isVisible = elemTop < window.innerHeight && elemBottom >= 0;
  console.log(isVisible);
  return isVisible;
  
}

function myScript(cl) {
  //var marquees = document.getElementsByClassName(cl);
  var marquees = document.getElementsByTagName(cl);

  for (i = 0; i < marquees.length; i++) {
    if (isScrolledIntoView(marquees[i])) {
      marquees[i].classList.add("visible");
    } else {
      //marquees[i].classList.remove("visible");
    }
  }
}

window.onscroll = function() {myScript("section")};