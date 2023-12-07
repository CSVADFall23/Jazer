doc = app.activeDocument;
var sel = doc.selection;


groupTiles(doc, sel);


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


}
function groupTiles(doc, sel){
    var len = sel.length;
    var group0 = doc.groupItems.add();
    
    for(var i = 0;i<len;i++){
        var item = doc.selection[i];
        var wid = yWidth(item);
        if(wid<14.5){
        item.move(group0, ElementPlacement.PLACEATEND);
        }
    }

}
function xWidth(item){
    var bounds = item.geometricBounds;
    
    var wid  =Math.abs(bounds[0] - bounds[2]);
    return wid;

}

function yWidth(item){
    var bounds = item.geometricBounds;
    
    var wid  =Math.abs(bounds[1] - bounds[3]);
    return wid;

}
//test();