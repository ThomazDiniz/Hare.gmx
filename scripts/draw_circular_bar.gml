/// draw_circular_bar(x ,y ,value, max, colour, radius, width, alpha);

if (argument2 > 0) { // no point even running if there is nothing to display (also stops /0
    var i, len, tx, ty, val;
    
    var numberofsections = 60 // there is no draw_get_circle_precision() else I would use that here
    var sizeofsection = 360/numberofsections
    
    val = (argument2/argument3) * numberofsections 
    
    if (val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
    
        var piesurface = surface_create(argument5*2,argument5*2)
            
        draw_set_colour(c_white);
        surface_set_target(piesurface)
        
        draw_clear_alpha(c_black,0)
        
        draw_primitive_begin(pr_trianglefan);
        draw_vertex(argument5, argument5);
        
        for(i=0; i<=val; i++) {
            len = (i*sizeofsection)+90; // the 90 here is the starting angle
            tx = lengthdir_x(argument5, len);
            ty = lengthdir_y(argument5, len);
            draw_vertex(argument5+tx, argument5+ty);
        }
        
        draw_primitive_end();
        
        draw_set_alpha(1);
        
        draw_set_blend_mode(bm_subtract)
        draw_set_colour(c_white)
            draw_circle(argument5-1, argument5-1,argument5-argument6,false)
        draw_set_blend_mode(bm_normal)

        surface_reset_target()
     
            /*draw_surface_ext(piesurface,(argument0-argument5)+1, (argument1-argument5)+1,
                                1,1,
                                0,c_black,0.3);
            */                  
            draw_surface_ext(piesurface,argument0-argument5, argument1-argument5,
                                1,1,
                                0,argument4,argument7);
                                
        
        surface_free(piesurface)
        
    }
    
}
