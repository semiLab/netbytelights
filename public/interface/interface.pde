
float r,g,b;
color wantedcol,currentcol,transcol;
float cr, cg, cb;
float tr,tg,tb;
float arcStart = PI / 2 + PI * 2 / 10;
void setup(){
    //size(screen.width,screen.height);
    size(window.innerWidth,window.innerHeight);
    wantedcol = color(100,50,100);
    currentcol = color(255,100,100);
    transcol = color(80,100,20);
    r = 0.9;
    g = 0.95;
    b = 1.0;
    cr = 0.5;
    cg = 0.7;
    cb = 0.4;
}
void draw(){
    int w = window.innerWidth / 5; 
    background(0,10,30);
    drawArc(w * 0.9, w, color(150,0,0), red(wantedcol));
    drawArc(w * 2.5, w, color(0,150,0), green(wantedcol));
    drawArc(w * 4.1, w, color(0,0,150), blue(wantedcol));

    noStroke();
    fill(currentcol);
    ellipse(w * 0.9, w, w * 0.85, w * 0.85);
    //rect(w, w * 1.5, w/2, w/2, w/20);
    fill(transcol);
    ellipse(w * 2.5, w, w * 0.85, w * 0.85);
    //rect(w * 1.5, w * 1.5, w/2, w/2, w/20);
    fill(wantedcol);
    ellipse(w * 4.1, w, w * 0.85, w * 0.85 );
    //rect(w * 2.5, w * 1.5, w/2, w/2, w/20);
    drawButtons();
    }
void mousePressed(){
    checkAndHandleArcs();
}
void mouseDragged(){
    checkAndHandleArcs();
}
void checkAndHandleArcs(){
    int w = window.innerWidth / 5; 
    if(dist(mouseX, mouseY, w*0.9, w) <= w){
        //Handle Red
        float a = getArcVal(w * 0.9, w);
        wantedcol = color(a*255, green(wantedcol), blue(wantedcol));
    }else if(dist(mouseX, mouseY, w * 2.5, w) <= w){
        //Handle green
        float a = getArcVal(w * 2.5, w);
        wantedcol = color(red(wantedcol), a * 255, blue(wantedcol));
    }else if(dist(mouseX, mouseY, w * 4.1, w) <= w){
        //Handle blue
        float a = getArcVal(w * 4.1, w);
        wantedcol = color(red(wantedcol), green(wantedcol), a * 255);
    }
}
float getArcVal(int x, int y){
    float a = -atan2(mouseX - x, mouseY - y);
    if(a < 0){
        a += 2 * PI;
    }
    a = constrain(a, 2 * PI * 0.1, 2 * PI * 0.9);
    a = norm(a, 2 * PI * 0.1, 2 * PI * 0.9);
    return a;
}
void drawArc(int offset,int size, color col,int val){
    stroke(col);
    noFill();
    strokeCap(SQUARE);
    float start = PI / 2 + PI * 2 / 10;
    //strokeWeight(size/2 * 1.1);
    //arc(offset,size,size,size,start, start + 2 * PI * val);
    strokeWeight(size/100);
    ellipse(offset, size, size * 1.54, size * 1.54);
    ellipse(offset, size, size * 0.86, size * 0.86);
    strokeWeight(size/3);
    stroke(red(col) * 0.5, green(col) * 0.5, blue(col) * 0.5);
    arc(offset,size,size * 1.2,size * 1.2,start, start + 2 * PI * val / 255 * 0.8 - PI / 20);
    //stroke(0,0,0);
    //arc(offset,size,size * 1.2,size * 1.2,PI / 2 - PI * 2 / 10, start);

}
void setRed(color c, float val){
  c = color(val, green(c), blue(c));
}
void setGreen(color c, float val){
  c = color(red(c), val, blue(c));
}
void setBlue(color c, float val){
  c = color(red(c), green(c), val);
}
//4 buttons per row
void drawButtons(){
    // Buttons we want:
    // - set
    // -attention
    // - Winning table
    // -transitions
    // Which sectors should be marked
    // slider for delay...or buttons?
    // Predefined colors? :
    // r,g,b,white, warm white, orange, yellow, purple
    fill(100,100,100);
    for(int i=0;i<4;i++){ 
    rect((i + 1) * w * 0.2 + i * w, w * 2.0, w, w, w/20);
    }

}
