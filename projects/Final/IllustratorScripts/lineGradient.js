// Illustrator ExtendScript

// Create a new document
var doc = app.documents.add();

// Set initial values
var numLines = 400;
var lineLength = doc.width; // Use the document width for line length
var initialSpacing = 2;

// Calculate the total height required by the lines
var totalHeight = doc.height;

// Calculate the vertical spacing increment
var spacingIncrement = (totalHeight - initialSpacing) / ((numLines - 1) * numLines / 2); // Sum of an arithmetic series

// Draw lines with increasing vertical spacing
var currentY = initialSpacing;
for (var i = 0; i < numLines; i++) {
  // Create a new line
  var line = doc.pathItems.add();
  line.setEntirePath([
    [0, currentY],
    [lineLength, currentY]
  ]);

  // Increment vertical spacing
  currentY += spacingIncrement * (i + 1);
}
