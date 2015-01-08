class Slide {
  int id;
  float value;
  int rad;
  float interval;
  int soundNum;


  Slide(int slide_id, float slide_value) {
    id = slide_id;
    value = slide_value;
    rad = 8;
    soundNum = 8;
    interval = 300 / soundNum;

  }

  void draw() {
    smooth();
    strokeWeight(3);
    strokeCap(ROUND);

    switch(id) {
    case 0:
      stroke(blue);
      fill(blue, 100);
      break;
    case 1:
      stroke(yellow);
      fill(yellow, 100);
      break;
    case 2:
      stroke(pink);
      fill(pink, 100);
      break;
    case 3:
      stroke(black);
      fill(black, 100);
      break;
    default:
      stroke(255);
      fill(255, 100);
    }
    line(50, 80*(id + 1), value + 50, 80*(id + 1));
    noStroke();
    ellipse(value+50, 80*(id + 1), 2*rad, 2*rad);
    
   if ((0 <= value)&&(value < interval * 1)) {
      text("do", 10, 80*(id + 1));
    } else if ((interval * 1 <= value)&&(value < interval * 2)) {
      text("re", 10, 80*(id + 1));
    } else if ((interval * 2 <= value)&&(value < interval * 3)) {
      text("mi", 10, 80*(id + 1));
    } else if ((interval * 3 <= value)&&(value < interval * 4)) {
      text("fa", 10, 80*(id + 1));
    } else if ((interval * 4 <= value)&&(value < interval * 5)) {
      text("so", 10, 80*(id + 1));
    } else if ((interval * 5 <= value)&&(value < interval * 6)) {
      text("ra", 10, 80*(id + 1));
    } else if ((interval * 6 <= value)&&(value < interval * 7)) {
      text("si", 10, 80*(id + 1));
    } else if ((interval * 7 <= value)&&(value <= interval * 8)) {
      text("do", 10, 80*(id + 1));
    }

    //edge
    if (value<0) {
      value = 0;
    } else if (value > 300) {
      value = 300;
    }
  }
  void setValue(int sensor){
    value = (sensor - 4) * 20;
  }

  /*void mouseDragged() {
    if ((80*(id + 1)-rad<=mouseY)&&(mouseY<=80*(id + 1)+rad)) {
      if ((value+50-rad<=mouseX)&&(mouseX<=value+50+rad)) {
        value=mouseX-50;
      }
    }
  }*/


  void play() {
    //value
    if ((0 <= value)&&(value < interval * 1)) {
      do_1.trigger();
    } else if ((interval * 1 <= value)&&(value < interval * 2)) {
      re.trigger();
    } else if ((interval * 2 <= value)&&(value < interval * 3)) {
      mi.trigger();
    } else if ((interval * 3 <= value)&&(value < interval * 4)) {
      fa.trigger();
    } else if ((interval * 4 <= value)&&(value < interval * 5)) {
      so.trigger();
    } else if ((interval * 5 <= value)&&(value < interval * 6)) {
      ra.trigger();
    } else if ((interval * 6 <= value)&&(value < interval * 7)) {
      si.trigger();
    } else if ((interval * 7 <= value)&&(value <= interval * 8)) {
      do_2.trigger();
    }
  }

  void stop() {
    do_1.close();
    re.close();
    mi.close();
    fa.close();
    so.close();
    ra.close();
    si.close();
    do_2.close();
    minim.stop();
 
  }
}

