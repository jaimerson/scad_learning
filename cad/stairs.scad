module step(number){
    rotation = [0, 0, 0];
    translation = [0, number * 20, number * 10];
    translate(translation) rotate(rotation) {
        cube([100, 20.5, 10]);
    }
}

module stair(steps=1){
    for(i=[0:1:steps-1]){
        step(i);
    }
    translate([0,steps * 20, steps* 10]){
       cube([100, 100, 10]);
    }
}

module stairwell(stores=2){
    for(i=[0:1:stores-1]){
        rotateZ = i * 90 % 360;
        
        if(rotateZ == 0){
            translate([0,0,i*100]) stair(10);
        }else{
            rotation = [0, 0, rotateZ];
            if(rotateZ == 90){
                translate([0,200,i*100]) rotate(rotation){
                    stair(10);
                }
            }else if(rotateZ == 180){
                translate([-200,200,i*100]) rotate(rotation){
                    stair(10);
                }
            }else if(rotateZ == 270) {
                translate([-200,0,i*100]) rotate(rotation){
                    stair(10);
                }
            }
        }
    }
}

stairwell(10);