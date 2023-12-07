var doc = app.activeDocument;
var artLayer = doc.layers[0];
app.defaultStroked = true;
app.defaultFilled = true;
var defColor = new RGBColor();
defColor.red =  255;
defColor.green = 255;
defColor.blue =  255;
doc.defaultFillColor = defColor;


var sq3 = Math.sqrt(3);
var blck = 7.0;
//var numB = 40;
var cenX = (doc.width)*0.5;
var cenY = (doc.height)*0.5;

gridDist = {};

drawItemsInCenter();

drawTiles(doc, 20);

//vizGrid(doc, gridDist);

var keyArray = [];
    for(keys in gridDist){
    keyArray.push(keys);
    }

var lastDex = -1;
var iters = 1000;


for(var h = 0; h<iters;h++){
    randLook(doc, gridDist, blck*sq3 + 1, keyArray, h, iters);
    }



function randLook(doc, grid, threshold, keyArray, iter, len){
    var thre = [];  
    var dex;
    var inc = (iter/len)
    var kLen = keyArray.length;
    if (keyArray && kLen > 0) {
    do {
        dex = Math.floor(Math.random()  * keyArray.length*(.025 + Math.max(0,(inc-.025))));
    } while (dex === lastDex);
    dex = Math.min(dex, kLen-1);
    dex = Math.max(0, dex);
    lastDex = dex;

        var curKey = keyArray[dex];
        //alert(curKey);
         grid[curKey] = [];
        var coordinates = curKey.split(',');
        var x = parseFloat(coordinates[0]);
        var y = parseFloat(coordinates[1]);

        for (var i = 0; i < doc.pathItems.length; i++) {
            var item = doc.pathItems[i];
            var pathCenter = getPathItemCenter(item);
            var difX = x - pathCenter[0];
            var difY = y - pathCenter[1];
            var dist = Math.sqrt(difX * difX + difY * difY);

            if (dist < threshold) {
                //grid[curKey] = grid[curKey] || [];
                grid[curKey].push(item);
               
            }

        }
    

     
        if (grid[curKey].length === 3) {
           // alert("found three");
            //alert(grid[curKey]);
            thre.push(grid[curKey]);
            groupAndRotate(doc, thre);
        }
    }

    //alert(threes.length);
   // return threes;
}

function groupAndRotate(doc, th){
    if(th[0].length===3){
       // alert("grouping");
    var newGroup = doc.groupItems.add();
    for(var s=0;s<3;s++){
        var n1 = th[0][s];
        var fresh = n1.duplicate();
        n1.remove();
        fresh.move(newGroup, ElementPlacement.PLACEATEND);
    }
        
    newGroup.rotate(180);
    for(var m=0;m<3;m++){
        var newItem = newGroup.pathItems[m];
        var fres = newItem.duplicate();
        var col = new RGBColor();
            col.red =  Math.random()*255;
            col.green = Math.random()*255;
            col.blue =  Math.random()*255;
            fres.fillColor = col;
        fres.move(doc.layers[0], ElementPlacement.PLACEATEND);
            }   
        }
    newGroup.remove();
}



function drawItemsInCenter(){
      var d1 = dia([cenX - blck, cenY], 0);

      var k1 = Math.round(cenX) + ',' + Math.round(cenY);
      gridDist[k1] = gridDist[k1] || [];
    

      var d2 = dia([cenX + .5*blck, cenY + 0.5*blck*sq3], -120);


      var d3 = dia([cenX + 0.5*blck, cenY - 0.5*blck*sq3], 120);

}
   
function drawTiles(doc, layers){   
    for(var i =1;i<=layers;i++){   
    var hexagon = doc.pathItems.polygon( cenX, cenY, (2*i+1)*blck, 6);
    hexagon.filled = false;
    var hexAnchors = [];
        for(var u=0;u<6;u++){
            var anc = hexagon.pathPoints[u].anchor;
            hexAnchors.push(anc);
        }
    hexagon.remove();
     var pos1 = hexAnchors[3];
     var pos2 = hexAnchors[2];
     var pos3 = hexAnchors[1];
     var pos4 = hexAnchors[0];
     var pos5 = hexAnchors[5];
     var pos6 = hexAnchors[4];
     
    var p1 = [pos1[0] - 0.5*blck, pos1[1] + 0.5*blck*sq3];
    var p2 = [pos2[0] , pos2[1] ];
    placeItemsAlongEdge(p1, p2, i+2, 0);
    var p3 = [pos3[0] + 0.5*blck , pos3[1] + 0.5*blck*sq3 ];
    placeItemsAlongEdge(pos2, p3, i+3, 0);   

    var pp3 = [pos3[0] + blck, pos3[1]];
    var p4 = [pos4[0] + 2.0*blck, pos4[1]];
    placeItemsAlongEdge(pp3, p4, i+3, -120);
    var pp4 = [pos4[0] + blck, pos4[1] - sq3*blck];
    var p5 = [pos5[0] + 0.5*blck, pos5[1] - 0.5*blck*sq3 ];
    placeItemsAlongEdge(pp4, p5, i+2, -120);
    

    var pp5 = [pos5[0] - 0.5*blck, pos5[1] - 0.5*blck*sq3];
    var p6 = [pos6[0] - blck, pos6[1] - blck*sq3 ];
    placeItemsAlongEdge(pp5, p6, i+3, 120);

    var pp6 = [pos6[0] - 2.0*blck, pos6[1]];
    var pp1 = [pos1[0] - blck, pos1[1]];
    placeItemsAlongEdge(pp6, pp1, i+2, 120);
    
    }

}






function placeItemsAlongEdge(anchor1, anchor2, numberOfItems, rot) {
    var doc = app.activeDocument;

    // Calculate the step for placing items along the edge
    var stepX = (anchor2[0] - anchor1[0]) / (numberOfItems - 2);
    var stepY = (anchor2[1] - anchor1[1]) / (numberOfItems - 2);

    // Place items along the edge
    for (var i = 0; i < numberOfItems-2; i++) {
        var posX = anchor1[0] + i * stepX ;
        var posY = anchor1[1] + i * stepY ;

        // Create a path item at the calculated position
        var diamond = dia([posX, posY], rot);
      
    }
}

function dia(pos, rot){
    var dia = doc.pathItems.add();
 
    
    dia.setEntirePath([[0, sq3*blck], [-blck, 0], [0, -sq3*blck], [blck, 0]]);
    dia.closed = true;
    dia.translate(pos[0], pos[1]);
    dia.rotate(rot);
  
    var gridPos = dia.pathPoints[3].anchor;
    var key = Math.round(gridPos[0]) + ',' + Math.round(gridPos[1]);
    gridDist[key] = gridDist[key] || [];

   dia.remove();
   
}

function vizGrid(doc, grid){
    for(key in grid ){
        var coordinates = key.split(',');
        var x = parseFloat(coordinates[0]);
        var y = parseFloat(coordinates[1]);
        var dot = doc.pathItems.ellipse(y + 2, x - 2, 4,4);
        var col = new RGBColor();
        col.red = 255;
        col.green = 0;
        col.blue =  0;
        dot.fillColor = col; 
    }

}


function getPathItemCenter(pathItem) {
    // For closed path items with 4 points, use geometric bounds
    var bounds = pathItem.geometricBounds;

    // Calculate the center of the bounds
    var centerX = (bounds[0] + bounds[2]) / 2;
    var centerY = (bounds[1] + bounds[3]) / 2;

    return [centerX, centerY];
}