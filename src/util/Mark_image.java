package util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.ImageIO;


public class Mark_image {

	public void plot(ArrayList[] image_array){
		
		for(int i = 0; i < 35; i++){
			if(image_array[i].size() != 0){
				if(Integer.toString(i).length() == 1){
					plotPolygonImage(image_array[i], "path-image-10"+i+"-0.jpg");
				}
				else{
					plotPolygonImage(image_array[i], "path-image-1"+i+"-0.jpg");
				}
			}
		}
	} 
	
	public static void plotPolygonImage(ArrayList<String> ba,String img_name) {
        //g.drawImage(img, 0, 0, null);
   
    BufferedImage img = null;
    
    try {
             img = ImageIO.read(new File("/home/kumar/workspace/hbase_web_new/WebContent/images/input/",img_name));
         } catch (IOException e) {
         }
     
    if(img==null) {
    System.out.println("Image is null");
    return;    	 
    }    	
    String[] array = ba.toArray(new String[ba.size()]);
    for(String b : array) {
     
    String p[]=b.split(";");         
         int x[]=new int[p.length];
         int y[]=new int[p.length];
         //System.out.println(p.length);
         for(int i=0;i<p.length;++i) {
        
        String cord[]=p[i].split(",");
        x[i]=(int)Float.parseFloat(cord[0]);
        y[i]=(int)Float.parseFloat(cord[1]);    	  
         }
     
    Graphics2D g2d=img.createGraphics();
        g2d.setColor(Color.GREEN);
        g2d.setStroke(new BasicStroke(3));
        //g2d.addRenderingHints(arg0);
        
        int x1 = 0,x2=0,y1 = 0,y2=0;        
    for(int i=0;i<x.length && i<y.length;++i) {    	
   
    if(i==0) {
    x1=x[0];
    y1=y[0];
    continue;
    }
    x2=x[i];
    y2=y[i];
    g2d.drawLine(x1, y1, x2, y2);
   
    x1=x2;
    y1=y2;  	
    }
   
    if(x.length >2 && y.length >2) {
    g2d.drawLine(x1, y1, x[0], y[0]);
    }
    }
        
        try {
        	ImageIO.write(img, "JPEG", new File("/home/kumar/workspace/hbase_web_new/WebContent/images/highlight/", img_name));
        } catch (IOException e) {
        	// TODO Auto-generated catch block
        	e.printStackTrace();
      }
        
    }	
}
