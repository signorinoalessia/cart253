// humans desire to get rare unusual thing happening, somehow making it happen

float value = random(0,1);
if (value < 0.01) {
  println("Ultra rare loot drop! 1% chance of this!");
}
else if (value < 0.06) {
  println("Pretty rare loot drop! 5% chance of this!");
}
else if (value < 0.16) {
  println("Kind of rare loot drop! 10% chance of this!");
}
else if (value < 0.5) {
  println("Okay loot drop. 34% chance of this...");
}
else {
  println("The same rusty battle-axe you always find. 50% chance of this.");
}