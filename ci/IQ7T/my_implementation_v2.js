// Make the following code print out “SUCCESS”… the purpose of this challenge is to implement your own version of getElementsByClassName . Your function will be called myGetElementsByClassName.
//  Your function will accept the a DOM element, and will traverse its DOM tree... returning all child dom elements with the specified className of 'external'

const { JSDOM } = require('jsdom');

function hasSpecifiedClassName(domElement, className) {
  return domElement.classList.contains(className)
}

function helper(node,className,childrenWithClassName) {
  if (node == null) {
    return null
  }
  if (hasSpecifiedClassName(node, className)) {
    childrenWithClassName.push(node)
  }
  let children = node.children
  for (let i=0; i < children.length; i++) {
    let node = children[i]
    helper(node,className,childrenWithClassName)
  }
  return childrenWithClassName
}

// Returns descendent elements that have the given className
function myGetElementsByClassName(element, className) {
  let childrenWithClassName = []
  helper(element,className,childrenWithClassName)
  return childrenWithClassName;
}

JSDOM.fromURL("https://developer.mozilla.org/en-US/docs/Web/API/Element").then(dom => {
  const docEl = dom.window.document.documentElement;

  const className = 'external';

  // reference method
  const specElements = docEl.getElementsByClassName(className);
  console.log('Spec:', specElements, specElements.length);

  // your method
  const myFoundElements = myGetElementsByClassName(docEl, className);
  console.log('Actual:', myFoundElements, myFoundElements.length);
  if (myFoundElements.length === specElements.length) {
    console.log('SUCCESS');
  } else {
    console.error('NOT YET');
  }
}).catch(e => console.error('Caught: ', e));
