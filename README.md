This is a proof of concept for sharing breakpoints between SASS and JS.

Breakpoints are stored in an array in the `breakpoints.json` file.

When Compass compiles SASS, it makes the breakpoints available as a SASS list via SASS function `breakpoints()`.

JS by-turn reads the JSON file from server via a GET request.