//based on Conway
//https://www.youtube.com/watch?v=ea7lJkEhytA
ArrayList<Integer> values = new ArrayList<Integer>();
int seed = 1;
float average = 0.0;
final int MAXITERATIONS = 5;
int loopcounter = 0;
void setup() {
  size(500, 500);
  background(51);
  values.add(seed); //add the seed
  println("seed = " + seed);
}

void draw() {
  if (loopcounter > MAXITERATIONS) exit();
  background(51);
  startEvaluation();
  printall();
  loopcounter++;
}

void startEvaluation() {
  ArrayList<Integer> newValues = new ArrayList<Integer>();
  int occurrence = 1;
  try {
    for (int i = 0; i < values.size(); i++) {
      if (values.get(i) == values.get(i + 1)) {
        occurrence++;
      } else {
        newValues.add(occurrence);
        newValues.add(values.get(i));
        occurrence = 1; //reset
      }
    }
  }
  catch(Exception e) {
    //out of bounds
    newValues.add(occurrence);
    newValues.add(values.get(values.size() - 1)); //add the missing value
  }
  values = newValues;
}





void printall() {
  average = 0.0;
  for (int v : values) {
    print(v);
    average += v;
  }
  average = average / values.size();
  println("\naverage: " + average);
}