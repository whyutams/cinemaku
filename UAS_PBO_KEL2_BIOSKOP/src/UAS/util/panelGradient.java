/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UAS.util;

import java.awt.Color;
import java.awt.Component;
import java.awt.GradientPaint;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.event.MouseMotionListener;
import javax.swing.JCheckBox;
import javax.swing.JFormattedTextField;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTextField;
import javax.swing.JToolBar;

public class panelGradient extends JPanel {

    public Color kStartColor;
    public Color kEndColor;
    public boolean kTransparentControls;
    public int kGradientFocus;

    public Color getkStartColor() {
        return this.kStartColor;
    }

    public void setkStartColor(Color kStartColor) {
        this.kStartColor = kStartColor;
    }

    public Color getkEndColor() {
        return this.kEndColor;
    }

    public void setkEndColor(Color kEndColor) {
        this.kEndColor = kEndColor;
    }

    public boolean iskTransparentControls() {
        return this.kTransparentControls;
    }

    public void setkTransparentControls(boolean kTransparentControls) {
        this.kTransparentControls = kTransparentControls;
    }

    public int getkGradientFocus() {
        return this.kGradientFocus;
    }

    public void setkGradientFocus(int kGradientFocus) {
        this.kGradientFocus = kGradientFocus;
    }

    public panelGradient() {
        this.kStartColor = new Color(139, 0, 0); // Warna merah tua
        this.kEndColor = new Color(0, 0, 0);     // Warna hitam
        this.kTransparentControls = true;
        this.kGradientFocus = 500;
        if (this.kTransparentControls) {
            this.setBg(true);
        } else {
            this.setBg(false);
        }
    }

    public synchronized void addMouseMotionListener(MouseMotionListener l) {
        super.addMouseMotionListener(l);
    }

    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        int w = this.getWidth();
        int h = this.getHeight();
        GradientPaint gp = new GradientPaint(0.0F, 0.0F, this.kStartColor, (float) this.kGradientFocus, (float) h, this.kEndColor);
        g2d.setPaint(gp);
        g2d.fillRect(0, 0, w, h);
    }

    private void setBg(boolean isOpaque) {
        Component[] components = this.getComponents();
        Component[] var3 = components;
        int var4 = components.length;

        for (int var5 = 0; var5 < var4; ++var5) {
            Component component = var3[var5];
            ((JLabel) component).setOpaque(isOpaque);
            ((JCheckBox) component).setOpaque(isOpaque);
            ((JTextField) component).setOpaque(isOpaque);
            ((JPasswordField) component).setOpaque(isOpaque);
            ((JFormattedTextField) component).setOpaque(isOpaque);
            ((JToolBar) component).setOpaque(isOpaque);
            ((JRadioButton) component).setOpaque(isOpaque);
        }

    }
}
