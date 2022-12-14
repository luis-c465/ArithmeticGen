/**
 * Class whitch stores images and audio to be played back
 * in the game
 *
 * Call the _setup method to load all the images and the sounds
 */
public class Stor {
  // * IMAGES
  public PImage impostor;
  public PImage player;

  // * BUTTONS
  public PImage enter;

  public PImage space;

  public PImage buttons;
  public PImage skeld;

  public PImage playAgain;

  public PImage intro;

  // * SHAPES
  public PShape plus;
  public PShape minus;

  public PShape check;
  public PShape wrong;

  // * SOUNDS

  // * FONTS
  public PFont nunito;

  // * MOVIES
  public Gif Mwinner;
  public Gif Mdefeat;

  public void _setup(PApplet p) {
    // * LOAD IMAGES
    impostor = loadImage("chad.png");
    player = loadImage("susy.png");

    // * LOAD BUTTONS
    enter = loadImage("btn/enter.png");
    space = loadImage("btn/space.png");

    buttons = loadImage("buttons.png");
    skeld = loadImage("skeld.png");

    playAgain = loadImage("play-again.png");

    intro = loadImage("intro.png");

    // * LOAD SHAPES
    plus = loadShape("plus.svg");
    minus = loadShape("minus.svg");

    check = loadShape("check.svg");
    wrong = loadShape("close.svg");

    // * LOAD SOUNDS

    // * LOAD FONTS
    nunito = createFont("fonts/Nunito.ttf", 64);

    // * LOAD MOVIES
    Mwinner = new Gif(p, "victory.gif");
    Mdefeat = new Gif(p, "defeat.gif");

    Mwinner.noLoop();
    Mdefeat.noLoop();
  }
}
