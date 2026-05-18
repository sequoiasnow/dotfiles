// Pull fonts from webpage, if the page is a google fonts list these are
// embedded hrefs, otherwise the window href contains the font name 
const potentialFonts =
  [ window.location.href
  , ...document.querySelectorAll("a.gf-block-anchor")
  ].map(a => a.href.split(/[\/&\?]/))
   .filter(arr => arr[3] == "specimen")
   .map(arr => arr[4])

   
console.log(`Downloading fonts ${fonts}`)

// Call completion to finish
completion(fonts);
