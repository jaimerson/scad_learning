module tabua120(location=[0,0,0]){
    translate(location){
        cube([120,10,2.4]);
    }
}

module tabua120x15(location=[0,0,0], colour=[1,0.6,1]){
    translate(location){
        color(colour) cube([120, 15, 2.4]);
    }
}

module tabua100(location=[0,0,0], colour=[0.6,0.6,1]){
    translate(location){
        color(colour) cube([15, 100, 2.4]);
    }
}

module box(location=[0,0,0], colour=[0.3,0.9,0.6]){
    translate(location){
        color(colour) cube([15, 15, 10]);
    }
}

module pallet(hasBase=false, hasAllBoxes=true) {
    //parte de cima
    for(i=[0:1:7]){
        tabua120([0, 12.85 * i, 0]);
    }
    
    
    //ligações
    for(i=[0:52.5:105]){
        tabua100([i, 0, -2.4]);
        for(j=[0:42.5:85]){
            // pés
            if(hasAllBoxes || j != 0){
                box([i, j, -12.4]);
            }
            
            if(hasBase){
                tabua120x15([0, j, -14.8]);
            }
        }
        
    }
    
};

module sofa(location=[0,0,0], encosto=true){
    translate(location){
        //assento
        pallet(true);
        translate([0,0, -17.2]) pallet(true);
        
        if(encosto){
            //encosto
            rotate([70, 0, 180]) translate([-120,-15,12]) {
                
                pallet(false, false);
            }
        }
    }
}

sofa();
sofa([-121,0,0]);
rotate([0,0,270]) sofa([-121,-221,0], false);
rotate([0,0,270]) sofa([-242,-221,0], true);