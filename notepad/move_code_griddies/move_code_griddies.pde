
int x =100;
int y = 100;
int size = 20;

int xMoveType = floor(random(-1,2)); // moves to closest value (aka 2), so moves -1, 0,1 (left or right randonmly)
int yMoveType = floor(random(-1,2));
x += size * xMoveType;
y += size * yMoveType;