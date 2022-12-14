/**
 * Generates a random test whitch has a minimum of 10 questions
 */
public class Test {
  public int numQuestions = 0;
  public int numCorrect = 0;
  public Question[] questions;
  public int curQues = 0;
  public boolean done = false;
  private Stor s;
  public String input = "";
  public boolean qCheck = false;
  public boolean correct = false;

  // Cycles before next question
  public int cyclesBNQ = 0;

  public final int CYCLES = 25;

  // Center width and center height respectively of the canvas
  private int cw;
  private int ch;

  // * Constants for drawing the UI

  // * Top
  private final int topHeight = 100;
  private final color topBg = #1e293b;
  private final int topSafe = 10;

  private final int taskBW = 600;
  private final int taskBH = 65;
  private final int space = 5;
  private final int borderSpace = 8;
  private int taskMid = (taskBH + space * 4) / 2;
  private int spaceBBars;

  // * Question
  private final int quesStart = 225;
  private final int quesSpace = 50;
  private color dividerC;

  // * Answer
  private final int ansStart = 430;

  public Test(int q, Stor s) {
    numQuestions = q;
    this.s = s;

    questions = new Question[q];
    for(int i = 0; i < q; i++) {
      questions[i] = new Question();
    }

    spaceBBars = (taskBW - space * 2) / q;
    dividerC = color(107, 114, 128, 99);
  }

  public void _setup() {
    // ! For debugging
    for(Question u : questions) {
      println(u);
    }

    cw = width / 2;
    ch = height / 2;
  }

  public void _draw() {
    if (done) return;

    drawTop();
    drawQuestion();
    drawAnswer();

    if (qCheck) {
      drawCorrect();

      if (--cyclesBNQ <= 0) {
        done = !nextQ();
      }
    }
  }

  private void drawTop() {
    pushMatrix();

    noStroke();
    fill(#323f2f);
    rect(topSafe, topSafe, taskBW + topSafe, taskBH + topSafe);
    noFill();

    fill(0);
    shapeMode(CORNER);
    for (int i = 0; i <= taskBW - space * 2; i+=spaceBBars) {
      int temp = i / spaceBBars;
      fill(#43d748);
      if (temp < curQues) {
        rect(
          i + topSafe + space,
          topSafe + space,
          spaceBBars,
          taskBH
        );
      }
      fill(0);

      rect(
        i + topSafe + space,
        topSafe + space,
        space,
        taskBH
      );

    }

    noFill();
    strokeWeight(space);
    stroke(0);
    rect(topSafe, topSafe, taskBW + topSafe, taskBH + topSafe);


    strokeWeight(borderSpace);
    stroke(163,182,187);
    rect(topSafe+space, topSafe+space, taskBW + topSafe-space*2, taskBH + topSafe-space*2);

    textAlign(LEFT, CENTER);
    textSize(28);
    stroke(0);
    strokeWeight(2);
    fill(255);
    text("TOTAL TASKS COMPLETED", topSafe+space*4, taskMid);

    fill(255);
    textSize(25);

    textAlign(RIGHT, CENTER);
    double percent = (double) numCorrect / numQuestions;
    String percentS = "" + Math.floor(percent*100) + "%";
    text("#Correct " + (numCorrect) + " / 10 (" + percentS + ")", width-topSafe*3, taskMid);

    popMatrix();
  }

  /**
   * Draws the current question to the canvas
   */
  private void drawQuestion() {
    pushMatrix();
    shapeMode(CENTER);
    imageMode(CENTER);
    image(stor.buttons, cw, ch);

    Question q = questions[curQues];

    // Draw the questions numbers
    textSize(64);
    textMode(CENTER);
    fill(0);
    text("" + q.num1, cw + quesSpace, quesStart);
    text("" + q.num2, cw + quesSpace, quesStart + 100);

    // Draw the arithmetic type
    shape(
      q.addition ? s.plus : s.minus,
      cw - quesSpace,
      quesStart + 80,
      75,
      75
    );

    // fill(dividerC);

    // rect(cw - quesSpace - 30, quesStart + 130,  quesSpace * 4, 10, 10);

    popMatrix();
  }

  private void drawAnswer() {
    pushMatrix();

    fill(0);
    textAlign(LEFT, CENTER);
    text(input, 260, ansStart);

    popMatrix();
  }

  private void drawCorrect() {
    shapeMode(CENTER);
    shape(
      correct ? s.check : s.wrong,
      200,
      ansStart + 10,
      50,
      50
    );
  }

  public void check() {
    qCheck = true;
    Question q = questions[curQues];
    correct = input.equals(q.sAnswer);
    cyclesBNQ = CYCLES;
  }

  public boolean nextQ() {
    qCheck = false;
    input = "";
    curQues++;
    if (correct) {
      numCorrect++;
    }

    if (curQues >= questions.length) return false;

    return true;
  }
}
