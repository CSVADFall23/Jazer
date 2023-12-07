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

    function sortHorizonally(items) {
        var topMost, curX, delIndex, curItem, tempItems = [];
        for (var x = 0, len = items.length; x < len; x++) {
            tempItems.push(items[x]);
        }

        while (tempItems.length) {
            topMost = tempItems[0];
            curX = topMost.left
            delIndex = 0;
            for (var x = 1, len = tempItems.length; x < len; x++) {
                curItem = tempItems[x];
                if (curItem.left > curX) {
                    topMost = curItem;
                    curX = curItem.left;
                    delIndex = x;
                }
            }
            topMost.zOrder(ZOrderMethod.BRINGTOFRONT);
            tempItems.splice(delIndex, 1);
        }
    }
    sortHorizonally(sel);
}

test();