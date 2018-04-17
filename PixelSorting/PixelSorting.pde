PImage img;
PImage sortedImg;
void setup() {
  //size(774, 387);
  size(720, 360);
  //img = loadImage("sunflower.jpg");
  img = loadImage("landscape.jpg");
  image(img, 0, 0);
  sortedImg = img.get();
  sortedImg.loadPixels();
}


int i = 0;
void draw() {
  println(frameRate);
  for (int ct = 0; ct < frameRate; ct++) {
    if (i < sortedImg.pixels.length-1) {
      color pi = sortedImg.pixels[i];
      //float coli = brightness(pi);
      color recordPix = -1;
      float record = 256;
      for (int j = i; j < sortedImg.pixels.length; j++) {
        color pj = sortedImg.pixels[j];
        float colj = brightness(pj);
        if (colj < record) {
          recordPix = j;
          record = colj;
        }

        //println("Comparing " + i + " with " + j);
      }
      
      //if(coli > record) {
        color aux = sortedImg.pixels[i];
        sortedImg.pixels[i] = sortedImg.pixels[recordPix];
        sortedImg.pixels[recordPix] = aux;
      //}
      
      i++;
    }
  }

  sortedImg.updatePixels();
  image(sortedImg, img.width, 0);
}