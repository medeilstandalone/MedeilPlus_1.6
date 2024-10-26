package com.vanuston.medeil.ui;
import javafx.ext.swing.SwingComponent;
import com.vanuston.medeil.util.CommonDeclare;
import java.util.HashMap;
import java.awt.Dimension;
import java.lang.Exception;
import com.vanuston.medeil.util.Logger;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;
import com.vanuston.medeil.util.ReportPanel;

public class ReportViewer {

var log: Logger = Logger.getLogger(ReportViewer.class, "Reports");
public var heading : String = "";
var repViewer : SwingComponent;
def reportPanel  = new ReportPanel();
var zoomSize = bind 0.7;

var panelW=bind (95.29860229 * ((CommonDeclare.panelFormW-70)/2)) / 100 on replace{
    changeSize(panelW,panelH,zoomSize);
    };
var panelH=225.0 on replace { changeSize(panelW,panelH,zoomSize); };

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "form-background"
        width: bind panelW+8
        height: bind panelH
    }
    
    public-read def panelRep: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 0.0
        blocksMouse: true
        focusTraversable: false
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        blocksMouse: true
        focusTraversable: false
        content: [ rectangle, panelRep, ]
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def font: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 23.0
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

function changeSize(i:Integer , j : Integer,zoomSize : Float):Void{
    repViewer.getJComponent().setPreferredSize(new Dimension(i,j));
    reportPanel.setZoom(zoomSize);
}


function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    try{
        panel.visible = false;
    }
    catch (e:Exception)
        {
        var msg:String="Class : Report viewer  method : imgCloseOnMouseClicked   = {e.getMessage()}";
       log.debug(msg);
        }
         }
    function imgCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = -1.0;
        fadeClose.play();
         }
    function imgCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = 1.0;
        fadeClose.play();
         }
var opacClose=0.5;
var fadeClose = Timeline {
    keyFrames: [
                at(0s) { opacClose => 0.5 tween Interpolator.LINEAR },
                at(0.1s) { opacClose => 1.0 tween Interpolator.LINEAR },
                ]
};
public function showReport(repSrc : String):Void{
    try{
            panel.visible = true;
            var repPanel = reportPanel.loadReportView(repSrc);
            repViewer = SwingComponent.wrap(repPanel);
            insRepPanel();
             }
        catch (e:Exception)
        {
        var msg:String="Class : ReportComplaintList  method : button1Action()   = {e.getMessage()}";
        log.debug(msg);
        }

}
public function showReport(repSrc : String,parm : HashMap):Void{
    try{
            panel.visible = true;
            repViewer = null;
            var repPanel = reportPanel.loadReportView(repSrc,parm);
            repViewer = SwingComponent.wrap(repPanel);
            changeSize(panelW,panelH,zoomSize);
            insRepPanel();
       }
       catch (e:Exception)
       {
        var msg:String="Class : ReportComplaintList  method : button1Action()   = {e.getMessage()}";
         log.debug(msg);
       }

}

public function showReport(repSrc : String,parm : HashMap,panelW: Integer,panelH: Integer):Void{
    try{
            panel.visible = true;
            repViewer = null;
            var repPanel = reportPanel.loadReportView(repSrc,parm);
            repViewer = SwingComponent.wrap(repPanel);
            changeSize(panelW,panelH,(0.7));
            insRepPanel();
       }
       catch (e:Exception)
       {
        var msg:String="Class : ReportViewer  method : button1Action()   = {e.getMessage()}";
         log.debug(msg);
       }

}

function insRepPanel():Void{
    try{
    delete panelRep.content;
    insert repViewer into panelRep.content;
                 }
        catch (e:Exception)
        {
        var msg:String="Class : ReportComplaintList  method : button1Action()   = {e.getMessage()}";
       log.debug(msg);
        }
}


}
