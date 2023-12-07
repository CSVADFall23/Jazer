function test() {
    if (!app.documents.length) {
        alert("You must have a document open.");
        return;
    }
    var docRef = app.activeDocument;
    var sel = docRef.selection;
    if (!sel.length) {
        alert("You must make a selection.");
        return;
    }

    function rotateOne(items, doc) {
        var newGroup = doc.groupItems.add();
        var len = items.length;
        for (var x = 0;  x < len; x++) {
            items[x].move(newGroup, ElementPlacement.PLACEATEND);
        }
        newGroup.rotate(180);
        var gLen = newGroup.pathItems.length;
        for(var i=0;i<gLen; i++){
            var g = newGroup.pathItems[i];
            var fresh = g.duplicate();
            var col = new RGBColor();
            col.red =  Math.random()*255;
            col.green = Math.random()*255;
            col.blue =  Math.random()*255;
            fresh.fillColor = col;
            fresh.move(doc.layers[0], ElementPlacement.PLACEATEND);

        }
        newGroup.remove();
    }
    rotateOne(sel, docRef);
}

test();