void setup() {
  size(1000, 1000);
}
//global variables
float boxWidth = 1000/3;
Game myGame = new Game();
int turn = 0; //0 is red, 1 is green
boolean gameRunning = true;
String gameWonBy = "";
int piecesIn = 0;


void draw() {
  background(255, 255, 255);
  if (gameRunning == true)
  {
    cursorHover();
  }

  board();
  myGame.colorPieces();
  myGame.checkWin();
  pushStyle();
  textSize(32);
  textAlign(CENTER);
  //fill(255, 255, 255);
  fill(0, 0, 0);
  if (gameWonBy == "Red") {
    text("This game was won by red", width/2, height/2);
    //println("should display text");
  } else if (gameWonBy == "Green") {
    text("This game was won by green", width/2, height/2);
    //println("should display text");
  } else if (gameWonBy == "Tie") {
    text("This game ended in a tie", width/2, height/2);
    //println("should display text");
  }
  popStyle();
}

//functions
void board() {
  pushStyle();
  strokeWeight(3);
  //first vertical line
  line(width/3, 0, width/3, height);
  //second vertical line
  line(2* width/3, 0, 2*width/3, height);

  //first horizontal line
  line(0, height/3, width, height/3);
  //second horizontal line
  line(0, 2*height/3, width, 2*height/3);
  popStyle();
}

void cursorHover() {
  //make the light green/red box over the position
  if (turn%2==0)
  {
    fill(255, 0, 0, 180);
  } else if (turn%2==1) {
    fill(0, 255, 0, 180);
  }
  //origin of the hover box
  int[] origin = getIndices();
  //draw the position
  rect(origin[1]*boxWidth, origin[0]*boxWidth, boxWidth, boxWidth);
}

void mouseClicked() {
  myGame.updatePosition(getIndices());
  //myGame.printPositions();
}

int[] getIndices() {
  int[] indices = new int[2];
  //x is index 0, y is index 1
  indices[0] = floor(mouseY/boxWidth);
  indices[1] = floor(mouseX/boxWidth);
  return indices;
}




//classes
class Game {
  int[][] positions = new int[3][3];
  Game() {
    for (int i=0; i<positions.length; i++) {
      for (int j=0; j<positions[i].length; j++) {
        positions[i][j]=-1;
      }
    }
  }
  void updatePosition(int[] indices) {
    if (gameRunning)
    {
      if (positions[indices[0]][indices[1]] == -1) {
        positions[indices[0]][indices[1]] = turn%2;
        turn=turn+1;
        piecesIn+=1;
      }
    }
  }

  void printPositions() {
    for (int i=0; i<positions.length; i++) {
      for (int j=0; j<positions[i].length; j++) {
        //print(positions[i][j]+" ");
      }
      //println();
    }
    //println();
  }

  void colorPieces() {
    for (int i=0; i<positions.length; i++) {
      for (int j=0; j<positions[i].length; j++) {
        //if position is 0 then color the position red
        if (positions[j][i]==0) {
          pushStyle();
          fill(255, 0, 0);
          rect(i*boxWidth, j*boxWidth, boxWidth, boxWidth);
          popStyle();
        } 
        //if position is 1 then color the position green
        else if (positions[j][i]==1) {
          pushStyle();
          fill(0, 255, 0);
          rect(i*boxWidth, j*boxWidth, boxWidth, boxWidth);
          popStyle();
        }
      }
    }
  }

  void checkWin() {
    //tie check
    if (piecesIn == 9 && gameRunning==true) {
      gameRunning = false;
      gameWonBy = "Tie";
      //println("Tie");
    }
    //row check
    for (int i=0; i<3; i++) {
      if (positions[i][0]==0 && positions[i][1]==0 && positions[i][2]==0) {
        gameRunning = false;
        gameWonBy = "Red";
        //println("gameWonBy Red");
      } else if (positions[i][0]==1 && positions[i][1]==1 && positions[i][2]==1) {
        gameRunning = false;
        gameWonBy = "Green";
        //println("gameWonBy Green");
      }
    }
    // column check
    for (int i=0; i<3; i++) {
      if (positions[0][i]==0 && positions[1][i]==0 && positions[2][i]==0) {
        gameRunning = false;
        gameWonBy = "Red";
        //println("gameWonBy Red");
      } else if (positions[0][i]==1 && positions[1][i]==1 && positions[2][i]==1) {
        gameRunning = false;
        gameWonBy = "Green";
        //println("gameWonBy Green");
      }
    }

    // diagonal check y=-x
    if (positions[0][0]==0 && positions[1][1]==0 && positions[2][2]==0) {
      gameRunning = false;
      gameWonBy = "Red";
      //println("gameWonBy Red");
    } else if (positions[0][0]==1 && positions[1][1]==1 && positions[2][2]==1) {
      gameRunning = false;
      gameWonBy = "Green";
      //println("gameWonBy Green");
    }

    // diagonal check y=x
    if (positions[0][2]==0 && positions[1][1]==0 && positions[2][0]==0) {
      gameRunning = false;
      gameWonBy = "Red";
      //println("gameWonBy Red");
    } else if (positions[0][2]==1 && positions[1][1]==1 && positions[2][0]==1) {
      gameRunning = false;
      gameWonBy = "Green";
      //println("gameWonBy Green");
    }
  }
}
