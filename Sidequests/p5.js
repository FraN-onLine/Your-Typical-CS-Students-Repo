let x;
let y;
/*
function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(3,23,231);
  fill(66,123,23)
  rect(0,300,400,100)
  fill(200,123,12)
  circle(7,7,10,10)
  circle(50,50,40,40)
  fill(150,78,22)
  rect(40,255,30,45)
  fill(11,122,2)
  rect(25,200,60,55) // hhhhhhhh
}
*/

function setup() {
  createCanvas(600, 200);
  noStroke();
  fill(232,32,22);
  x = 0;
  y = 33;
}

function draw(){
  background(12,212,11);
  x += 0.05
  x *= 1.015 //accelaration go brr
  arc(x,y, 90, 90, 0.77, 1.44)
}

fun
