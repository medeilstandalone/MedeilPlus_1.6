/*
 * DoctorNewInformation.fx
 *
 * Created on 7 Aug, 2024, 6:33:08 PM
 */
package com.vanuston.medeil.ui;
//import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import javafx.scene.image.Image;
import javax.imageio.ImageIO;
//import com.vanuston.medeil.util.ImageReader;
//import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.Logger;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
//import com.sun.javafx.io.File;
//import com.vanuston.medeil.util.ImageReader;
//import org.dcm4che3.imageio.plugins.dcm.DicomImageReader;
//import org.dcm4che3.imageio.plugins.dcm.DicomImageReaderSpi;
//import javax.imageio.stream.ImageInputStream;
//import javax.imageio.ImageReader;
//import javax.imageio.ImageIO;
import javafx.scene.image.*;
import java.lang.System;
import java.net.URL;
import com.vanuston.medeil.util.Upload;
import java.lang.Exception;

import com.vanuston.medeil.util.DICOMToImageConverter;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
//import javax.imageio.ImageReader;

//import javafx.embed.swing.SwingFXUtils;
/**
 * @author Vanitha
 */
public class DoctorNewInformation {

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 397.0
        styleClass: "form-background"
        stroke: null
        width: bind panelW
        height: bind panelH
    }
    
    def __layoutInfo_button: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 10.0
        layoutY: 20.0
        layoutInfo: __layoutInfo_button
        effect: null
        text: "open dcm file"
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def Arial_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 18.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
        blue: 0.0
    }
    
    public-read def red: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.6
        green: 0.6
        blue: 1.0
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "rectFormHeader"
        fill: linearGradientHeader
        stroke: Green
        width: bind panelW
        height: 32.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectHeader, rectangle, button, ]
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def reflectionEffect2: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def reflectionEffect3: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def instance: javafx.scene.image.Image = javafx.scene.image.Image {
        url: ""
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def image6: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def image7: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def imageCursor: javafx.scene.ImageCursor = javafx.scene.ImageCursor {
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "FromSales", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.layoutX = 10.0;
                            rectangle.stroke = Green;
                            button.cursor = null;
                            button.layoutX = 10.0;
                            button.layoutY = 40.0;
                            __layoutInfo_button.width = 140.0;
                            __layoutInfo_button.height = 35.0;
                            button.onMouseClicked = onMouseClickUploadFile;
                            button.effect = reflectionEffect;
                            button.text = "View Dicom File";
                            button.font = null;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.layoutX = 397.0;
                            rectangle.stroke = null;
                            button.layoutX = 10.0;
                            button.layoutY = 20.0;
                            button.effect = null;
                            button.text = "open dcm file";
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    function mouseClickOnSaveFunction(event: javafx.scene.input.MouseEvent): Void {
    //TODO
    }

    function mouseClickFunctionOnTag(event: javafx.scene.input.MouseEvent): Void {
    //TODO
    }

    var curDir: File = new File(System.getProperty("user.dir"));
    var path: URL = curDir.toURL();
//    var imgPath: String = "images/User.png";
//    var images: Image = Image { url: "{__DIR__}images/User.png" };
    var log: Logger = Logger.getLogger(DoctorNewInformation.class, "DICOM");
//    var doctorNewController: DoctorNew;
//    var doctorController: Doctor;
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
//    def CustomAlert = CustomAlert {};
    var seperatorW = bind CommonDeclare.seperatorW;
//        var seperatorW = bind CommonDeclare.seperatorW;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var panelH = bind CommonDeclare.panelFormH;
    var panelW = bind CommonDeclare.panelFormW;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;//200
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;//150
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;//50
//    var Type5TextboxW = bind (3.811944091 * panelW / 100);//30
    var ImgDocSplArrow = bind C4LX + Type2TextboxW;
    var ImgCountryArrow = bind C2LX + Type2TextboxW;
    var ImgStateArrow = bind C2LX + Type2TextboxW;
    var ImgDocCodeArrow = bind C2LX + Type3TextboxW;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbutton1LX = 30.0;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
//    var bottonW = bind CommonDeclare.bottonW;
    var CancelW = bottonW;
    var doctorNewModel = null;
//    var bottonH = bind CommonDeclare.bottonH;
    var getAutoIncre: String;
    var frame: JFrame = null;
    public var value: Integer;
    var style = {
                "-fx-border-width:2;"
                "-fx-border-color:#666666;"
                "-fx-background-color: white ;"
            }

    function onMouseClickUploadFile(event: javafx.scene.input.MouseEvent): Void {
        uploadFile();
    }

    public function uploadFile(): Void {
        var fc = new JFileChooser();
        fc.setMultiSelectionEnabled(true);
        fc.setFileFilter(new FileNameExtensionFilter("DICOM Files", "dcm"));
        var returnVal: Integer = fc.showOpenDialog(null);
        if (returnVal == JFileChooser.APPROVE_OPTION) {
            var files: File[] = fc.getSelectedFiles(); // Get the selected files
            if (files != null) {
                //for (var file: File in files) {
                var dicom = new DICOMToImageConverter();
                //                dicom.displayMultipleDICOMFiles(files);
                //                DICOMMetadataReader.readMetadata(file,dcmFileName,dcmFolderName);
//                dicom.displayMultipleDICOMFiles(files);

            } else {
                System.out.println("There is no dcm file");
            }

        }

    }

   
    public function Startup(): Void {

        panel.visible = true;
        currentState.actual = currentState.findIndex("Shown");
        panel.content = [rectangle, rectHeader, button];

    }

}













