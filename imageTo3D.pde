/*----------------------------------------
|    Breaking Apart an Image in 3D Space  |
|      Coded by: Erik Dillaman            |
 ----------------------------------------*/

PImage img;
int cellsize = 4;
int cols, rows;

//Move mouse LEFT and RIGHT to make the mosaic fly apart

void setup()
{
  
  // Import any picture you want, but set the proper size below
  size(1, 1, P3D); //<>//
  img = loadImage("image.jpg");
  surface.setSize(img.width, img.height);
  println(img.width + "   " + img.height);
  cols = width / cellsize;
  rows = height / cellsize;
  pixelDensity(2);

}

void draw()
{
  background(255);
  img.loadPixels();
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      int x = i*cellsize + cellsize/2;
      int y = j*cellsize + cellsize/2;
      int loc = x + y * width;
      color c = img.pixels[loc];
      
      float z = map(brightness(img.pixels[loc]), 0,255, 0, mouseX);
      
      pushMatrix();
      translate(x, y, z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
 
    }
  }
}
