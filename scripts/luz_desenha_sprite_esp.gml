///luz_desenha_sprite_esp();
var s = other.s;
var xx = other.px;
var yy = other.py;
var _vpx = (x-view_xview)*s;
var _vpy = (y-view_yview)*s;
var _opx = (x-view_xview)*s;
var _opy = (y-view_yview)*s;
//var dir = point_direction(xx,yy,_vpx,_vpy);
var dir = other.direction;
var ix = image_xscale*s;
var iy = image_yscale*s;
var alp = 1;//0.5
var i = 0;
repeat(2){//4
    draw_sprite_ext(sprite_index,image_index,_vpx,_vpy,ix,iy,image_angle,image_blend,alp);
    //_vpx+=lengthdir_x(2,dir);
    //_vpy+=lengthdir_y(2,dir);
    _vpx+=lengthdir_x(1,dir);
    _vpy+=lengthdir_y(1,dir);
    //ix+=0.05;
    //iy+=0.05;
    alp-=0.1;
    i++;
    if i == 2{
        var offx = sprite_xoffset*s;
        var offy = sprite_yoffset*s;
        var sw = sprite_width*s;
        var sh = sprite_height*s;
        var lx = lengthdir_x(60,dir);
        var ly = lengthdir_y(60,dir);
        _opx-=offx;
        _opy-=offy;
        draw_primitive_begin(pr_trianglestrip);
            draw_vertex_colour(_opx+sw/2,_opy,c_white,1);
            draw_vertex_colour(_opx+sw/2,_opy+sh,c_white,1);
            
            draw_vertex_colour(_opx+sw/2+lx,_opy+ly,c_black,0);
            draw_vertex_colour(_opx+sw/2+lx,_opy+sh+ly,c_black,0);
        draw_primitive_end();
    }
}
