Table data;
float[] numericData;
float [] plotData;
int numCols;
int axisOffset = 100;
void setup() {
  size(1000, 500);
  loadData();
  dataTransformation();
  drawAxes();
  drawGrid();
  printLabels();
  plotPoints();
}

void draw() {
  //drawGrid();
  //loadData();
  //plotPoints();
}

void drawAxes() {
  axisOffset = 50;
  pushStyle();
  strokeWeight(2);
  //y axis
  line(axisOffset, 0, axisOffset, height-axisOffset);
  //x-axis
  line(0+axisOffset, height-axisOffset, width, height-axisOffset);
  popStyle();
}

void loadData() {
  data = loadTable("data.csv");
  TableRow row = data.getRow(0);
  numCols = row.getColumnCount();
  numericData = new float[numCols];
  for (int i=0; i<numCols; i++) {
    numericData[i] = Float.parseFloat(row.getString(i));
  }
  //println();
}

void printData() {
  for (int i=0; i<numericData.length; i++)
  {
    print(numericData[i] + " | ");
  }
  println();
}

void drawGrid()
{
  // data will be in the range of 0 < 9*(height-axisOffset)
  pushStyle();
  stroke(0,0,0,40);
  // for drawing Horizontal grid lines
  float xLineGap = (height-axisOffset)/9;
  for (float y=height-axisOffset; y>=0; y=y-xLineGap){
    line(axisOffset,y,width,y);
  }
  //println(numCols);
  float yLineGap = (width-axisOffset)/numCols;
  for (float x=axisOffset+yLineGap;x<=width; x+=yLineGap)
  {
    line(x,0,x,height-axisOffset);
  }
  popStyle();
}

void dataTransformation(){
  // data will be in the range of 0 < 9*(height-axisOffset)
  //transform the data
  plotData = new float[numCols];
  for(int i=0;i<numCols;i++)
  {
    plotData[i] = numericData[i]*(height-axisOffset)/9;
  }
  //println(plotData);
}

void plotPoints(){
  float yLineGap = (width-axisOffset)/numCols;
  for(int i=0;i<numCols;i++){
    strokeWeight(4);
    float yCoord = height-(plotData[i]+axisOffset+yLineGap);
    //println(plotData[i]);
    point(axisOffset+yLineGap+(yLineGap)*i,yCoord);
  }
}

void printLabels(){
  //title
  fill(0,0,0);
  textSize(18);
  textAlign(CENTER);
  String title = "Graph Of Average Pace Against Run Days";
  text(title,width/2, height-(axisOffset/5));
  
  
  //x-axis labels
  float yLineGap = (width-axisOffset)/numCols;
  for(int i=0;i<numCols;i++)
  {
    text(i+1,axisOffset+yLineGap+(yLineGap)*i, height-(axisOffset*3/5));
  }
  
  //y-axis labels
  float xLineGap = (height-axisOffset)/9;
  int text = 0;
  for(float y=height-axisOffset; y>=0; y=y-xLineGap)
  {
    text(text,axisOffset-10,y);
    text++;
    println(text);
  }
    
  for (float y=height-axisOffset; y>=0; y=y-xLineGap){
    line(axisOffset,y,width,y);
  }
}
