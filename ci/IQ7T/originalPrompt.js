const { JSDOM } = require('jsdom');

// Returns descendent elements that have the given className
function getElementsByClassName(element, className) {
  return [];
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
