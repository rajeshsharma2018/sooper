package com.simplesarkar.web;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JScrollPane;

class ImageComponent extends JComponent {
    private final BufferedImage img;

    public ImageComponent(URL url) throws IOException {
        img = ImageIO.read(url);
        setPreferredSize(new Dimension(img.getWidth(), img.getHeight()));

    }
    @Override protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(img, 0, 0, img.getWidth(), img.getHeight(), this);

    }
    public static void main(String[] args) throws Exception {

    final URL lenna =
        new URL("https://resident.uidai.net.in/check-aadhaar-status?p_p_id=checkaadhaarstatus_WAR_rpcheckaadhaarstatusportlet&p_p_lifecycle=2&p_p_state=normal&p_p_mode=view&p_p_resource_id=captchaImage&p_p_cacheability=cacheLevelPage&p_p_col_id=column-1&p_p_col_count=1");

    final ImageComponent image = new ImageComponent(lenna);

    JFrame frame = new JFrame("Test");
    frame.add(new JScrollPane(image));

    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.setSize(400, 300);
    frame.setVisible(true);
   }
}
