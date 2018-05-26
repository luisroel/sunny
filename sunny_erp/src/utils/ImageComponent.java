/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author lespinoza
 */
public final class ImageComponent extends Component {
    private BufferedImage img;
    
    public ImageComponent(String path){
        loadImage("../erp/img/sunny.jpeg");
    }
    
    public void loadImage(String path){
        img = null;
        try{
            img = ImageIO.read(new File(path));
        } catch(IOException e){}        
    }
    
    @Override
    public void paint(Graphics g){
        g.drawImage(img, 0, 0, null);
    }
    
    @Override
    public Dimension getPreferredSize(){
        if (img == null){
            return new Dimension(100, 100);
        } else {
            return new Dimension(img.getWidth(), img.getHeight());
        }
    }
}
