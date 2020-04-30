const { JSDOM } = require('jsdom');

// Returns descendent elements that have the given className
function getElementsByClassName(element, className) {
  // implement this
  let matches = []
  console.log("Within getElementsByClassName")
  console.log("parent element contains desired className", element.classList.contains(className))
  if (hasSpecifiedClassName(element, className)) {
    matches.push(element)
  }
  for (var i=0; i<element.children.length;i++) {
    // currentElement = collection.children[i]
    // if (hasSpecifiedClassName(currentElement, className)) {
    //   matches.push(currentElement)
    // }
    getElementsByClassName(currentElement, className)
  }


  // DOM tree of elements
  // iterate over each element
  // based on its list of classes, we determine if it has a class name of className eg. 'external'
  // element.children.forEach(function(childElement) {
  //   console.log("checking children", childElement.classList.contains(className));
  // })

  //    parent
  //    /  \
  //   c    c
  // for (var i=0; i<element.children.length;i++) {
  //   console.log(element.children[i].classList.contains(className))
  // }
  return matches;
}

// collection
// iterate
function getChildrenWithSpecifiedClassName(collection, className) {
  matches = []
  for (var i=0; i<collection.children.length;i++) {
    currentElement = collection.children[i]
    if (currentElement.children.length > 0) {
      getChildrenWithSpecifiedClassName(
        getChildrenWithSpecifiedClassName.children,
        className
      )
    }
    else {
      matches.push(currentElement) if hasSpecifiedClassName(currentElement, className)
    }
  }
}

function hasSpecifiedClassName(domElement, className) {
  return domElement.classList.contains(className)
}


JSDOM.fromURL("https://developer.mozilla.org/en-US/docs/Web/API/Element").then(dom => {
  const docEl = dom.window.document.documentElement;

  const className = 'external';

  // reference method
  const specElements = docEl.getElementsByClassName(className);
  console.log('Spec:', specElements, specElements.length);

  // your method

  const actualElements = getElementsByClassName(docEl, className);
  console.log('Actual:', actualElements, actualElements.length);

  if (actualElements.length === specElements.length) {
    console.log('SUCCESS');
  } else {
    console.error('NOT YET');
  }
}).catch(e => console.error('Caught: ', e));
