int[] sizes = {0,10,15,20,25,30,35,40, 35, 30, 25, 20, 15, 10, 0};
int i = 0;

void draw()
{
  frameRate(13);
  background(0);
  rectMode(CENTER);
  rect(width/2,height/2,sizes[i],sizes[i]);
  i = (i + 1) % sizes.length;
}