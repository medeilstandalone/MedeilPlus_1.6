/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.util;

import com.vanuston.medeil.controller.DicomController;
import com.vanuston.medeil.implementation.DicomImplementation;
import com.vanuston.medeil.model.DicomModel;
import java.io.File;
import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;


import java.awt.image.BufferedImage;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.AffineTransform;
import java.io.ByteArrayOutputStream;
import java.sql.*;

import java.util.Timer;
//import javax.swing.Timer;
import java.util.List;
import java.util.ArrayList;
import java.util.TimerTask;
import javax.swing.border.Border;
import javax.swing.border.LineBorder;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.filechooser.FileNameExtensionFilter;
import org.dcm4che3.data.Attributes;
import org.dcm4che3.data.Tag;
import org.dcm4che3.imageio.plugins.dcm.DicomImageReadParam;
import org.dcm4che3.imageio.plugins.dcm.DicomImageReader;
import org.dcm4che3.imageio.plugins.dcm.DicomImageReaderSpi;
import org.dcm4che3.io.DicomInputStream;

/**
 *
 * @author Vanitha
 */
public class DICOMToImageConverter {

    static Logger log = Logger.getLogger(DICOMToImageConverter.class, "com.vanuston.medeil.util.DICOMToImageConverter");
    // Variables to track panning
    private Point mouseDownCompCoords = null;
    private Point imageOrigin = new Point(0, 0);
//    Image scaledImage;
    private boolean isMagnifyEnabled = false;  // To control zoom functionality
    private double scale = 1.0;
    private final double SCALE_STEP = 0.1;
    private BufferedImage currentImage;  // Current image displayed in the left panel
    private static final int MAX_FILES = 5;
    private static BufferedImage[] frames;
    private static int totalFrames = 1;
    private static int currentFrame = 0;
    private static Timer frameTimer;
    private JFrame frame = new JFrame("DICOM Image Viewer");
    private JPanel leftPanel = new JPanel();
    private JPanel rightPanel = new JPanel();
    private List<JLabel> fileLabels = new ArrayList<JLabel>();
    private List<File> dicomFiles = new ArrayList<File>();
    private File currentFile = null;
    private File currentFiles = null;
    private JLabel imageLabel = new JLabel();
    private JSlider slider;
    JButton playButton;
    JButton stopButton;
    private JPanel controlsPanel = new JPanel();
    private JLabel previousSelectedLabel = null;
    private JLabel previousSelectedCtrlLabel = null;
    public List<File> dcmFile = new ArrayList<File>();
    private String patientName;
    private boolean checkFileSave = false;
    public String findings = "";
    public String impressions = "";
    public String observation = "";
    public String recommendations = "";
    public String measurements = "";
    public String additionalNotes = "";
    public String sequence = "";
    private boolean imageSaveSuccess = false;
    public String findType = "";

    public void displayMultipleDICOMFiles(File[] files, final DicomModel dicomModel, final Date todayDate) {

        final Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        frame.setSize(screenSize.width, screenSize.height);
        frame.setLayout(new BorderLayout(30, 10));
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.setBackground(Color.LIGHT_GRAY);
        try {
            ImageIcon logo = new ImageIcon("src/com/vanuston/medeil/ui/images/LogoMedil.png");
            frame.setIconImage(logo.getImage());
        } catch (Exception e) {
            String ss = "Class : DICOMToImageConverter  Method  : displayMultipleDICOMFiles() Exception:" + e.getMessage();
            log.debug(ss);
            e.printStackTrace();
        }


        imageLabel.setBackground(Color.BLACK);
        leftPanel.add(imageLabel, BorderLayout.CENTER);
        leftPanel.setBackground(Color.BLACK);
        frame.add(leftPanel, BorderLayout.CENTER);


        // Right panel (east) for file thumbnails
        rightPanel.setLayout(new BoxLayout(rightPanel, BoxLayout.Y_AXIS));
        JScrollPane scrollPane = new JScrollPane(rightPanel);
        frame.add(scrollPane, BorderLayout.EAST);
        rightPanel.setToolTipText("Single Click Image to view the full image");
        scrollPane.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));

        // Add buttons on the west side (left) of the frame
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new BoxLayout(buttonPanel, BoxLayout.Y_AXIS));
        buttonPanel.setPreferredSize(new Dimension(200, frame.getHeight() - 60));

        JButton uploadButton = new JButton("Upload");
        uploadButton.setBackground(Color.BLUE);
        uploadButton.setForeground(Color.WHITE);
        uploadButton.setMaximumSize(new Dimension(150, 40));
        uploadButton.setAlignmentX(JComponent.CENTER_ALIGNMENT); // Center horizontally


        // Remove button
        JButton removeButton = new JButton("Remove");
        removeButton.setBackground(Color.BLUE);
        removeButton.setForeground(Color.WHITE);
        removeButton.setMaximumSize(new Dimension(150, 40));
        removeButton.setAlignmentX(JComponent.CENTER_ALIGNMENT); // Center horizontally
        removeButton.setToolTipText("Double Click Image / 'Ctlr + image' to remove");

        JButton tagButton = new JButton("Information");
        tagButton.setBackground(Color.BLUE);
        tagButton.setForeground(Color.WHITE);
        tagButton.setMaximumSize(new Dimension(150, 40));
        tagButton.setAlignmentX(JComponent.CENTER_ALIGNMENT); // Center horizontally

        final JButton magnifyButton = new JButton("Magnify");
        magnifyButton.setBackground(Color.BLUE);
        magnifyButton.setForeground(Color.WHITE);
        magnifyButton.setMaximumSize(new Dimension(150, 40));
        magnifyButton.setAlignmentX(JComponent.CENTER_ALIGNMENT);

        JButton saveButton = new JButton("Save");
        saveButton.setBackground(Color.BLUE);
        saveButton.setForeground(Color.WHITE);
        saveButton.setMaximumSize(new Dimension(150, 40));
        saveButton.setAlignmentX(JComponent.CENTER_ALIGNMENT);
        saveButton.setToolTipText("Save all image directly as dcm file");

        JButton saveAsButton = new JButton("Save as");
        saveAsButton.setBackground(Color.BLUE);
        saveAsButton.setForeground(Color.WHITE);
        saveAsButton.setMaximumSize(new Dimension(150, 40));
        saveAsButton.setAlignmentX(JComponent.CENTER_ALIGNMENT);
        saveAsButton.setToolTipText("Save in a particular folder as image file.");

        JButton reportButton = new JButton("report");
        reportButton.setBackground(Color.BLUE);
        reportButton.setForeground(Color.WHITE);
        reportButton.setMaximumSize(new Dimension(150, 40));
        reportButton.setAlignmentX(JComponent.CENTER_ALIGNMENT);

        buttonPanel.add(Box.createVerticalStrut(10));  // Spacer
        buttonPanel.add(uploadButton);
        buttonPanel.add(Box.createVerticalStrut(10));  // Spacer between buttons
        buttonPanel.add(removeButton);
        buttonPanel.add(Box.createVerticalStrut(10));  // Spacer between buttons
        buttonPanel.add(tagButton);
        buttonPanel.add(Box.createVerticalStrut(10)); // Spacer between buttons
        buttonPanel.add(magnifyButton);
        buttonPanel.add(Box.createVerticalStrut(10)); // Spacer between buttons
        buttonPanel.add(reportButton);
        buttonPanel.add(Box.createVerticalStrut(10)); // Spacer between buttons
        buttonPanel.add(saveButton);
        buttonPanel.add(Box.createVerticalStrut(10)); // Spacer between buttons
        buttonPanel.add(saveAsButton);



        buttonPanel.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));

        frame.add(buttonPanel, BorderLayout.WEST);
        controlsPanel.setLayout(new BorderLayout());
        controlsPanel.setLayout(new BoxLayout(controlsPanel, BoxLayout.X_AXIS));
        controlsPanel.setPreferredSize(new Dimension(frame.getWidth() / 2, 30));
        frame.add(controlsPanel, BorderLayout.SOUTH);


        reportButton.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {
//                 String dcmFileName = currentFiles.getName();
//                openReportSheet();
                int baseType = 0;
                String type = dicomModel.getType();
                if (type.equals("X - Ray")) {
                    baseType = 1;

                } else if (type.equals("Ultrasound")) {
                    baseType = 2;

                } else if (type.equals("Echo")) {
                    baseType = 4;

                } else if (type.equals("MRI Scan")) {
                    baseType = 6;

                }
                openReportDialog(dicomModel, baseType, todayDate);
            }
        });

        // Set upload button functionality
        uploadButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                if (dicomFiles.size() >= MAX_FILES) {
                    JOptionPane.showMessageDialog(frame, "It already exist  5 files. If you want to add a new file, remove one file.", "Warning", JOptionPane.WARNING_MESSAGE);

//                    messageLabel.setText("It already has 5 files. If you want to add a new file, you need to remove one.");
                } else {
                    JFileChooser fileChooser = new JFileChooser();
                    fileChooser.setMultiSelectionEnabled(true);
                    fileChooser.setFileFilter(new FileNameExtensionFilter("DICOM Files", "dcm"));
                    int result = fileChooser.showOpenDialog(frame);
                    System.out.println(result);
                    if (result == JFileChooser.APPROVE_OPTION) {
                        File[] selectedFiles = fileChooser.getSelectedFiles();
                        int fileCount = selectedFiles.length;
                        int n = dicomFiles.size();
                        if (dicomFiles.size() < MAX_FILES) {
                            if (fileCount + dicomFiles.size() <= MAX_FILES) {
                                for (File file : selectedFiles) {

                                    addDICOMFileToRightPanel(file, imageLabel);
                                }
                            } else {
                                JOptionPane.showMessageDialog(frame, "You can add " + (MAX_FILES - n) + " more file, as the max limit is 5 and already " + n + " been added.", "Warning", JOptionPane.WARNING_MESSAGE);

                            }

                        } else {
                            JOptionPane.showMessageDialog(frame, "It already exist 5 files. If you want to add a new file, you need to remove one.", "Warning", JOptionPane.WARNING_MESSAGE);

                        }

                    }
                }
            }
        });


        // Set remove button functionality
        removeButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                List<JLabel> labelsToRemove = new ArrayList<JLabel>();  // Store labels to remove
                for (JLabel label : fileLabels) {
                    Border border = label.getBorder();
                    if (border instanceof LineBorder) {
                        LineBorder lineBorder = (LineBorder) border;
                        if (lineBorder.getLineColor().equals(Color.BLUE) && lineBorder.getThickness() == 3) {
                            labelsToRemove.add(label);  // Add to removal list if selected
                        }
                    }
                }

                // Remove the selected labels and associated files
                for (JLabel label : labelsToRemove) {
                    System.out.println(labelsToRemove.size() + " size of labels to remove");
                    int index = fileLabels.indexOf(label);  // Find the index of the label
                    System.out.println(index + " index");
                    if (index != -1) {
                        dicomFiles.remove(index);  // Remove the corresponding file
                        fileLabels.remove(index);  // Remove the label from the list
                        rightPanel.remove(label);  // Remove the label from the panel
                    }
                }
                rightPanel.revalidate();
                rightPanel.repaint();

                if (!dicomFiles.contains(currentFiles)) {
                    System.out.println("not work properly");
                    imageLabel.setIcon(null);
                    imageLabel.revalidate();
                    imageLabel.repaint();
                    currentFile = null;
                    currentFiles = null;
                }
            }
        });

        tagButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                tagInformation();
            }
        });

        saveAsButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                saveAsFunction();
            }
        });

        magnifyButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {

                if (currentFiles != null) {
                    isMagnifyEnabled = !isMagnifyEnabled;
                    magnifyButton.setText(isMagnifyEnabled ? "Magnify On" : "Magnify Off");
                } else {
                    JOptionPane.showMessageDialog(frame, "Please select a DICOM file to create/edit a report.", "Information", JOptionPane.INFORMATION_MESSAGE);

                }
            }
        });

        leftPanel.addMouseWheelListener(new MouseWheelListener() {

            @Override
            public void mouseWheelMoved(MouseWheelEvent e) {
                if (isMagnifyEnabled) {
                    // Throttle zoom events
                    if (e.getWheelRotation() < 0) {
                        scale += SCALE_STEP; // Zoom in
                    } else {
                        scale = Math.max(0.1, scale - SCALE_STEP); // Zoom out, minimum 10%
                    }
                    // Use SwingWorker to prevent UI freezing
//                    new ZoomWorker(scale).execute();
                    if (currentImage != null) {
                        new ZoomWorker(scale).execute();
                    } else {
                        JOptionPane.showMessageDialog(frame, "No image to zoom!", "Error", JOptionPane.ERROR_MESSAGE);
                    }

                }
            }
        });

        // Add mouse listeners for dragging (panning) functionality
        leftPanel.addMouseListener(new MouseAdapter() {

            @Override
            public void mousePressed(MouseEvent e) {
                mouseDownCompCoords = e.getPoint();
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                mouseDownCompCoords = null;
            }
        });

        leftPanel.addMouseMotionListener(new MouseMotionAdapter() {

            @Override
            public void mouseDragged(MouseEvent e) {
                if (isMagnifyEnabled && scale > 1.0) {
                    Point currCoords = e.getPoint();
                    int deltaX = currCoords.x - mouseDownCompCoords.x;
                    int deltaY = currCoords.y - mouseDownCompCoords.y;

                    imageOrigin.translate(deltaX, deltaY);
                    imageLabel.setLocation(imageOrigin); // Update the image's location

                    mouseDownCompCoords = currCoords; // Update the last mouse position
                }
            }
        });
        this.patientName = patientName;

        final int[] actionCount = {0};
        saveButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                if (currentFiles != null) {
                    if (checkFileSave) {
                        JOptionPane.showMessageDialog(frame, "This file already saved.", "Message", JOptionPane.PLAIN_MESSAGE);

                    } else {
                        if (dicomFiles.size() == 1) {
                            saveFunction(dicomModel, todayDate);
                        } else {
                            JOptionPane.showMessageDialog(frame, "You can save only one file at a time so remove remaining file.", "Message", JOptionPane.PLAIN_MESSAGE);

                        }

                    }
                } else {
                    JOptionPane.showMessageDialog(frame, "Please select a DICOM file to create/edit a report.", "Information", JOptionPane.INFORMATION_MESSAGE);

                }
            }
        });

        rightPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        findType = dicomModel.getType();


        if (files.length < 6) {
            for (final File file : files) {
                System.out.println("-----");
                System.out.println(file);
                addDICOMFileToRightPanel(file, imageLabel);
            }
        } else {
//            messageLabel.setText("It already has 5 files. If you want to add a new file, remove one file first.");
            JOptionPane.showMessageDialog(frame, "It already exist 5 files. If you want to add a new file, remove one file.", "Information", JOptionPane.PLAIN_MESSAGE);

        }

        frame.setVisible(true);
//        existingFrame=frame;
    }

    private void getDicomModelData(DicomModel dicomModel, Date todayDate) {
        try {


            DicomImplementation dicomCon = new DicomController();
            for (int i = 0; i < dcmFile.size(); i++) {
                dcmFile.remove(i);
            }

            for (int i = 0; i < dicomFiles.size(); i++) {
                dcmFile.add(dicomFiles.get(i));

            }
            String patientCode = dicomModel.getPatientCode();
            String query = "select * from cust_information where cust_code = '" + patientCode + "';";

            List<DicomModel> customModel = (List<DicomModel>) dicomCon.selectQuery(query);
//            DicomModel dicomModel = null;
            for (DicomModel custom : customModel) {
                dicomModel.setPatientId(custom.getPatientId());
                dicomModel.setPatientName(custom.getPatientName());
                dicomModel.setMobileNo(custom.getMobileNo());

            }
            int billId = dicomModel.getDicomId();

            byte[] dcmDate = readFileToByteArray(currentFiles);
            dicomModel.setFileData(dcmDate);
            String targetFolder = currentFiles.getAbsolutePath();
            String fileName = currentFiles.getName();
            dicomModel.setDicomFile(targetFolder);
            dicomModel.setFileName(fileName);
            dicomModel.setCurrentDate(todayDate);



        } catch (Exception e) {
            String ss = "Class : DICOMToImageConverter  Method  : displayMultipleDICOMFiles() Exception:" + e.getMessage();
            log.debug(ss);
            e.printStackTrace();
        }
//        return dicomModel;
    }

    private void saveFunction(DicomModel dicomModel, Date todayDate) {
        try {
            getDicomModelData(dicomModel, todayDate);

            DicomImplementation dicomCon = new DicomController();

            int billId = dicomModel.getDicomId();
            boolean success = false;
            String type = dicomModel.getType();
            if (type.equals("X - Ray")) {
                dicomModel.setFinding(findings);
                dicomModel.setImpression(impressions);
                dicomModel.setRecommendation(recommendations);
                success = dicomCon.createRecord(dicomModel, 1);
                if (success) {
                    checkFileSave = true;

                    JOptionPane.showMessageDialog(frame, "X -Ray save successFully.", "Success", JOptionPane.PLAIN_MESSAGE);

                } else {
                    System.out.println("not success");
                    JOptionPane.showMessageDialog(frame, "Unsupported X -Ray File.", "Success", JOptionPane.PLAIN_MESSAGE);

                }
            } else if (type.equals("Ultrasound")) {
                dicomModel.setFinding(findings);
                dicomModel.setImpression(impressions);
                dicomModel.setMeasurements(measurements);
                dicomModel.setRecommendation(recommendations);
                dicomModel.setAdditionalNotes(additionalNotes);
                success = dicomCon.createRecord(dicomModel, 2);
                if (success) {
                    checkFileSave = true;

                    JOptionPane.showMessageDialog(frame, "Ultrasound save successFully.", "Success", JOptionPane.PLAIN_MESSAGE);

                } else {
                    System.out.println("not success");
                    JOptionPane.showMessageDialog(frame, "Unsupported Ultrasound File.", "Success", JOptionPane.PLAIN_MESSAGE);

                }
            } else if (type.equals("MRI Scan")) {
                dicomModel.setFinding(findings);
                dicomModel.setImpression(impressions);
                dicomModel.setSequences(sequence);
                dicomModel.setRecommendation(recommendations);

                success = dicomCon.createRecord(dicomModel, 6);
                if (success) {
                    checkFileSave = true;

                    JOptionPane.showMessageDialog(frame, "Magnetic Resonance Imaging save successFully.", "Success", JOptionPane.PLAIN_MESSAGE);

                } else {
                    System.out.println("not success");
                    JOptionPane.showMessageDialog(frame, "Unsupported Magnetic Resonance Imaging File.", "Success", JOptionPane.PLAIN_MESSAGE);

                }
            } else if (type.equals("Echo")) {
                dicomModel.setFinding(findings);
                dicomModel.setImpression(impressions);
                dicomModel.setMeasurements(measurements);
                dicomModel.setRecommendation(recommendations);

                success = dicomCon.createRecord(dicomModel, 4);
                if (success) {
                    checkFileSave = true;

                    JOptionPane.showMessageDialog(frame, "Echocardiography save successFully.", "Success", JOptionPane.PLAIN_MESSAGE);

                } else {
                    System.out.println("not success");
                    JOptionPane.showMessageDialog(frame, "Unsupported Echocardiography File.", "Success", JOptionPane.PLAIN_MESSAGE);

                }
            }


            if (checkFileSave) {
                String qry = " update billing_main bm JOIN billing_sub bs ON bm.billid = bs.billrefid set bm.status=1 ,bs.status=1 where bm.billid=" + billId + " and bs.billrefid=" + billId + "";
                System.out.println(qry);
                boolean ans = dicomCon.updateQuery(qry);
                if (ans) {
                    System.out.println("query succcee");
                }
            }


        } catch (Exception e) {
            String ss = "Class : DICOMToImageConverter  Method  : saveFunction() Exception:" + e.getMessage();
            log.debug(ss);
            e.printStackTrace();
        }

    }


    private void saveAsFunction() {
        if (currentImage == null) {
            JOptionPane.showMessageDialog(frame, "No image is available to save.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        // Show a file chooser to save the image
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Save Image");
        FileNameExtensionFilter jpegFilter = new FileNameExtensionFilter("JPEG Image", "jpg", "jpeg");
        FileNameExtensionFilter pngFilter = new FileNameExtensionFilter("PNG Image", "png");
        fileChooser.addChoosableFileFilter(jpegFilter);
        fileChooser.addChoosableFileFilter(pngFilter);
        fileChooser.setAcceptAllFileFilterUsed(false);

        int userSelection = fileChooser.showSaveDialog(frame);

        if (userSelection == JFileChooser.APPROVE_OPTION) {
            File fileToSave = fileChooser.getSelectedFile();
            String fileExtension = "";
            if (fileChooser.getFileFilter() == jpegFilter) {
                fileExtension = "jpg";
            } else if (fileChooser.getFileFilter() == pngFilter) {
                fileExtension = "png";
            }
            if (!fileToSave.getName().toLowerCase().endsWith("." + fileExtension)) {
                fileToSave = new File(fileToSave.getAbsolutePath() + "." + fileExtension);
            }

            try {
                saveImageAsImageFile(currentImage, fileToSave, fileExtension);
//                }
                JOptionPane.showMessageDialog(frame, "Image saved successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(frame, "Error saving the image: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                String ss = "Class : DICOMToImageConverter  Method  : saveAsFunction Exception:" + ex.getMessage();
                log.debug(ss);
                ex.printStackTrace();
            }
        }


    }

    private void saveImageAsImageFile(BufferedImage image, File file, String format) throws IOException {
        BufferedImage rgbImage = convertToRGB(image);
        ImageIO.write(rgbImage, format, file);

//        ImageIO.write(image, format, file);
    }

    private BufferedImage convertToRGB(BufferedImage image) {
        if (image.getType() != BufferedImage.TYPE_INT_RGB) {
            BufferedImage rgbImage = new BufferedImage(image.getWidth(), image.getHeight(), BufferedImage.TYPE_INT_RGB);
            Graphics2D g = rgbImage.createGraphics();
            g.drawImage(image, 0, 0, null);
            g.dispose();
            return rgbImage;
        }
        return image;
    }

    private void tagInformation() {
        if (currentFile == null) {
            JOptionPane.showMessageDialog(frame, "No image selected to show information.", "Error", JOptionPane.ERROR_MESSAGE);

            return;
        }

        // Create a dialog to display the table
        final JDialog tagDialog = new JDialog(frame, "Tag Information", true);
        tagDialog.setSize(400, 200);
        tagDialog.setLayout(new BorderLayout());
        // Create data for the table (4 rows and 2 columns)
        ReadDICOMMetadata rdm = new ReadDICOMMetadata();
        String patientName = rdm.readMetadata(currentFile, "patientName");
        String modality = rdm.readMetadata(currentFile, "modality");
        String patientID = rdm.readMetadata(currentFile, "patientID");
        String patientBOD = rdm.readMetadata(currentFile, "patientBOD");
        String patientSex = rdm.readMetadata(currentFile, "patientSex");
        String specificCharacterSet = rdm.readMetadata(currentFile, "specificCharacterSet");
        String imageType = rdm.readMetadata(currentFile, "imageType");
        String instanceCreationDate = rdm.readMetadata(currentFile, "instanceCreationDate");
        String instanceCreationTime = rdm.readMetadata(currentFile, "instanceCreationTime");
        String sopClassUID = rdm.readMetadata(currentFile, "sopClassUID");
        String sopInstanceUID = rdm.readMetadata(currentFile, "sopInstanceUID");
        String studyDate = rdm.readMetadata(currentFile, "studyDate");
        String acquisitionDate = rdm.readMetadata(currentFile, "acquisitionDate");
        String contentDate = rdm.readMetadata(currentFile, "contentDate");
        String studyTime = rdm.readMetadata(currentFile, "studyTime");
        String acquisitionTime = rdm.readMetadata(currentFile, "acquisitionTime");
        String contentTime = rdm.readMetadata(currentFile, "contentTime");
        String studyDescription = rdm.readMetadata(currentFile, "studyDescription");
        String procedureCodeSequence = rdm.readMetadata(currentFile, "procedureCodeSequence");
        String seriesDescription = rdm.readMetadata(currentFile, "seriesDescription");
        String referencedPerformedProcedureStepSequence = rdm.readMetadata(currentFile, "referencedPerformedProcedureStepSequence");
        String contrastBolusAgent = rdm.readMetadata(currentFile, "contrastBolusAgent");
        String scanOptions = rdm.readMetadata(currentFile, "scanOptions");
        String sliceThickness = rdm.readMetadata(currentFile, "sliceThickness");

        String kVP = rdm.readMetadata(currentFile, "kVP");
        String spacingBetweenSlices = rdm.readMetadata(currentFile, "spacingBetweenSlices");
        String dataCollectionDiameter = rdm.readMetadata(currentFile, "dataCollectionDiameter");
        String protocolName = rdm.readMetadata(currentFile, "protocolName");
        String reconstructionDiameter = rdm.readMetadata(currentFile, "reconstructionDiameter");
        String gantryDetectorTilt = rdm.readMetadata(currentFile, "gantryDetectorTilt");
        String tableHeight = rdm.readMetadata(currentFile, "tableHeight");
        String rotationDirection = rdm.readMetadata(currentFile, "rotationDirection");
        String xRayTubeCurrent = rdm.readMetadata(currentFile, "xRayTubeCurrent");
        String exposure = rdm.readMetadata(currentFile, "exposure");
        String filterType = rdm.readMetadata(currentFile, "filterType");
        String convolutionKernel = rdm.readMetadata(currentFile, "convolutionKernel");
        String patientPosition = rdm.readMetadata(currentFile, "patientPosition");
        String studyInstanceUID = rdm.readMetadata(currentFile, "studyInstanceUID");
        String seriesInstanceUID = rdm.readMetadata(currentFile, "seriesInstanceUID");
        String seriesNumber = rdm.readMetadata(currentFile, "seriesNumber");
        String instanceNumber = rdm.readMetadata(currentFile, "instanceNumber");
        String imagePositionPatient = rdm.readMetadata(currentFile, "imagePositionPatient");
        String imageOrientationPatient = rdm.readMetadata(currentFile, "imageOrientationPatient");
        String frameOfReferenceUID = rdm.readMetadata(currentFile, "frameOfReferenceUID");
        String sliceLocation = rdm.readMetadata(currentFile, "sliceLocation");
        String imageComments = rdm.readMetadata(currentFile, "imageComments");
        String samplesPerPixel = rdm.readMetadata(currentFile, "samplesPerPixel");
        String photometricInterpretation = rdm.readMetadata(currentFile, "photometricInterpretation");
        String rows = rdm.readMetadata(currentFile, "rows");
        String columns = rdm.readMetadata(currentFile, "columns");
        String pixelSpacing = rdm.readMetadata(currentFile, "pixelSpacing");
        String bitsAllocated = rdm.readMetadata(currentFile, "bitsAllocated");
        String bitsStored = rdm.readMetadata(currentFile, "bitsStored");
        String highBit = rdm.readMetadata(currentFile, "highBit");
        String pixelRepresentation = rdm.readMetadata(currentFile, "pixelRepresentation");
        String windowCenter = rdm.readMetadata(currentFile, "windowCenter");
        String windowWidth = rdm.readMetadata(currentFile, "windowWidth");
        String rescaleIntercept = rdm.readMetadata(currentFile, "rescaleIntercept");
        String rescaleSlope = rdm.readMetadata(currentFile, "rescaleSlope");
        String lossyImageCompression = rdm.readMetadata(currentFile, "lossyImageCompression");
        String lossyImageCompressionRatio = rdm.readMetadata(currentFile, "lossyImageCompressionRatio");
        String scheduledProcedureStepDescription = rdm.readMetadata(currentFile, "scheduledProcedureStepDescription");
        String scheduledProtocolCodeSequence = rdm.readMetadata(currentFile, "scheduledProtocolCodeSequence");
        String scheduledProcedureStepID = rdm.readMetadata(currentFile, "scheduledProcedureStepID");
        String performedProcedureStepDescription = rdm.readMetadata(currentFile, "performedProcedureStepDescription");
        String performedProtocolCodeSequence = rdm.readMetadata(currentFile, "performedProtocolCodeSequence");
        String requestAttributesSequence = rdm.readMetadata(currentFile, "requestAttributesSequence");
        String requestedProcedureID = rdm.readMetadata(currentFile, "requestedProcedureID");
        String PixelData = rdm.readMetadata(currentFile, "PixelData");
        String personTelephoneNumbers = rdm.readMetadata(currentFile, "personTelephoneNumbers");
        String patientTelephoneNumbers = rdm.readMetadata(currentFile, "patientTelephoneNumbers");


        String[][] data = {
            {"modality", modality},
            {"patientName", patientName},
            {"patientSex", patientSex},
            {"patientID", patientID},
            {"patientBOD", patientBOD},
            {"specificCharacterSet", specificCharacterSet},
            {"imageType", imageType},
            {"instanceCreationDate", instanceCreationDate},
            {"instanceCreationTime", instanceCreationTime},
            {"sopClassUID", sopClassUID},
            {"sopInstanceUID", sopInstanceUID},
            {"studyDate", studyDate},
            {"acquisitionDate", acquisitionDate},
            {"contentDate", contentDate},
            {"studyTime", studyTime},
            {"acquisitionTime", acquisitionTime},
            {"contentTime", contentTime},
            {"studyDescription", studyDescription},
            {"procedureCodeSequence", procedureCodeSequence},
            {"seriesDescription", seriesDescription},
            {"referencedPerformedProcedureStepSequence", referencedPerformedProcedureStepSequence},
            {"contrastBolusAgent", contrastBolusAgent},
            {"scanOptions", scanOptions},
            {"sliceThickness", sliceThickness},
            {"kVP", kVP},
            {"spacingBetweenSlices", spacingBetweenSlices},
            {"dataCollectionDiameter", dataCollectionDiameter},
            {"protocolName", protocolName},
            {"reconstructionDiameter", reconstructionDiameter},
            {"gantryDetectorTilt", gantryDetectorTilt},
            {"tableHeight", tableHeight},
            {"rotationDirection", rotationDirection},
            {"xRayTubeCurrent", xRayTubeCurrent},
            {"exposure", exposure},
            {"filterType", filterType},
            {"convolutionKernel", convolutionKernel},
            {"patientPosition", patientPosition},
            {"studyInstanceUID", studyInstanceUID},
            {"seriesInstanceUID", seriesInstanceUID},
            {"seriesNumber", seriesNumber},
            {"instanceNumber", instanceNumber},
            {"imagePositionPatient", imagePositionPatient},
            {"imageOrientationPatient", imageOrientationPatient},
            {"frameOfReferenceUID", frameOfReferenceUID},
            {"sliceLocation", sliceLocation},
            {"imageComments", imageComments},
            {"samplesPerPixel", samplesPerPixel},
            {"photometricInterpretation", photometricInterpretation},
            {"rows", rows},
            {"columns", columns},
            {"pixelSpacing", pixelSpacing},
            {"bitsAllocated", bitsAllocated},
            {"bitsStored", bitsStored},
            {"highBit", highBit},
            {"pixelRepresentation", pixelRepresentation},
            {"windowCenter", windowCenter},
            {"windowWidth", windowWidth},
            {"rescaleIntercept", rescaleIntercept},
            {"rescaleSlope", rescaleSlope},
            {"lossyImageCompression", lossyImageCompression},
            {"lossyImageCompressionRatio", lossyImageCompressionRatio},
            {"scheduledProcedureStepDescription", scheduledProcedureStepDescription},
            {"scheduledProtocolCodeSequence", scheduledProtocolCodeSequence},
            {"scheduledProcedureStepID", scheduledProcedureStepID},
            {"performedProcedureStepDescription", performedProcedureStepDescription},
            {"performedProtocolCodeSequence", performedProtocolCodeSequence},
            {"requestAttributesSequence", requestAttributesSequence},
            {"requestedProcedureID", requestedProcedureID},
            {"PixelData", PixelData},
            {"patientTelephoneNumbers", patientTelephoneNumbers},
            {"personTelephoneNumbers", personTelephoneNumbers}
        };

        // Column names
        String[] columnNames = {"Patient Details", "Patient Information"};

        // Create the table with data and column names
        JTable tagTable = new JTable(data, columnNames);
        JScrollPane scrollPane = new JScrollPane(tagTable);
        tagDialog.add(scrollPane, BorderLayout.CENTER);

        // Create a button to close the dialog
        JButton closeButton = new JButton("Close");
        closeButton.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                tagDialog.dispose();
            }
        });

        // Add the close button to the dialog
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(closeButton);
        tagDialog.add(buttonPanel, BorderLayout.SOUTH);
        // Display the dialog
        tagDialog.setLocationRelativeTo(frame); // Center it relative to the main frame
        tagDialog.setVisible(true);

    }

    // Add DICOM file to right panel with click listener
    public void addDICOMFileToRightPanel(final File file, final JLabel imageLabel) {
        boolean fileExists = false;
        for (File existingFile : dicomFiles) {
            if (existingFile.getName().equalsIgnoreCase(file.getName())) {
                fileExists = true;
                break;
            }
        }

        // If the file already exists, show a confirmation dialog
        if (fileExists) {
            int option = JOptionPane.showConfirmDialog(frame,
                    "This file already exist. Do you want to replace it?",
                    "File Exists",
                    JOptionPane.YES_NO_OPTION,
                    JOptionPane.WARNING_MESSAGE);

            if (option == JOptionPane.NO_OPTION) {
                return; // Do not proceed if the user chooses not to replace the file
            } else {
                // Remove the existing file and its associated label from the right panel
                for (int i = 0; i < dicomFiles.size(); i++) {
                    if (dicomFiles.get(i).getName().equalsIgnoreCase(file.getName())) {
                        rightPanel.remove(fileLabels.get(i)); // Remove the label
                        fileLabels.remove(i); // Remove the label from the list
                        dicomFiles.remove(i); // Remove the file from the list
                        break;
                    }
                }
            }
        }

        DicomInputStream dis = null;

        try {
            dis = new DicomInputStream(file);
            Attributes attributes = dis.readDataset(-1, -1);

            if (!attributes.contains(Tag.PixelData)) {
                JOptionPane.showMessageDialog(frame, "DICOM file has no pixel data.",
                        "Missing Pixel Data", JOptionPane.WARNING_MESSAGE);
                return;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "DICOM file has no pixel data.",
                    "Missing Pixel Data", JOptionPane.WARNING_MESSAGE);

            String ss = "Class : DICOMToImageConverter  Method  : addDICOMFileToRightPanel() Exception:" + e.getMessage();
            log.debug(ss);
            e.printStackTrace();
        }
        DICOMImagePlugins dip = new DICOMImagePlugins();
        try {

            dip.checkImageIOPlugins();
            ImageIO.scanForPlugins();

            ImageInputStream iis = ImageIO.createImageInputStream(file);
            BufferedImage bufferedImage = null;

            DicomImageReaderSpi readerSpi = new DicomImageReaderSpi();

            DicomImageReader reader = (DicomImageReader) readerSpi.createReaderInstance();


            reader.setInput(iis);


            if (findType.equals("MRI Scan")) {

                bufferedImage = reader.read(0);

            } else {
                DicomImageReadParam param = (DicomImageReadParam) reader.getDefaultReadParam();

                bufferedImage = reader.read(0, param);
            }
            ImageIcon icon = new ImageIcon(bufferedImage.getScaledInstance(150, 150, Image.SCALE_SMOOTH));
            final JLabel fileLabel = new JLabel(icon);
            fileLabel.setBorder(BorderFactory.createLineBorder(Color.GRAY, 10));
            fileLabel.setToolTipText(file.getName());
            fileLabel.addMouseListener(new MouseAdapter() {

                public void mouseClicked(MouseEvent e) {
                    fileLabel.setBorder(BorderFactory.createLineBorder(Color.GRAY, 10));
                    // Single-click without Ctrl -> Select single file for display
                    if (e.getClickCount() == 1 && !e.isControlDown()) {
                        // Remove red border from the previous selection, if it exists
                        if (previousSelectedLabel != null && previousSelectedLabel != fileLabel) {
                            previousSelectedLabel.setBorder(BorderFactory.createLineBorder(Color.GRAY, 10));
                        } else if (previousSelectedCtrlLabel != null && previousSelectedCtrlLabel != fileLabel) {
                            previousSelectedCtrlLabel.setBorder(BorderFactory.createLineBorder(Color.GRAY, 10));
                        }
                        currentFile = null;
                        fileLabel.setBorder(null);
//                            clearBorders();  // Clear any previous selections
                        System.out.println("----------------");
                        fileLabel.setBorder(BorderFactory.createLineBorder(Color.RED, 3));  // Highlight the selected file in red
                        loadDICOMFramesIntoLeftPanel(file, imageLabel);  // Display the selected DICOM file in the left panel
                        currentFile = file;
                        currentFiles = file;

                        // Ctrl + Click -> Select multiple files for removal (highlight in gray)
                        // Update the reference to the currently selected label
                        previousSelectedLabel = fileLabel;
                    } else if (e.isControlDown() || e.getClickCount() == 2) {
                        fileLabel.setBorder(null);
                        if (fileLabel.getBorder() == null) {
                            fileLabel.setBorder(BorderFactory.createLineBorder(Color.BLUE, 3));  // Highlight selected files in gray
                            previousSelectedCtrlLabel = fileLabel;
                        }

                    }
                }
            });
            fileLabels.add(fileLabel);
            dicomFiles.add(file);
            rightPanel.add(fileLabel);
            rightPanel.revalidate();
            rightPanel.repaint();

        } catch (Exception e) {
//            messageLabel.setText("UnSupported File format");
            JOptionPane.showMessageDialog(frame, "UnSupported File format.", "Error", JOptionPane.ERROR_MESSAGE);
            String ss = "Class : DICOMToImageConverter  Method  : addDICOMFileToRightPanel Exception:" + e.getMessage();
            log.debug(ss);
            e.printStackTrace();

        }
    }

    // Clears the border of all labels in the right panel
    private void clearBorders() {
        for (JLabel label : fileLabels) {
            label.setBorder(null);
        }
    }

    public void loadDICOMFramesIntoLeftPanel(File file, JLabel imageLabel) {
        BufferedImage bufferedImage = null;
        try {
            ImageInputStream iis = ImageIO.createImageInputStream(file);
            DicomImageReaderSpi readerSpi = new DicomImageReaderSpi();
            DicomImageReader reader = (DicomImageReader) readerSpi.createReaderInstance();
            reader.setInput(iis);
            DicomImageReadParam param = (DicomImageReadParam) reader.getDefaultReadParam();
            totalFrames = reader.getNumImages(true);
            frames = new BufferedImage[totalFrames];

            for (int i = 0; i < totalFrames; i++) {
                frames[i] = reader.read(i, param);
            }
            bufferedImage = frames[0];
//            currentImage = bufferedImage;
            currentFiles = file;

        } catch (Exception e) {
            String ss = "Class : DICOMToImageConverter  Method  : loadDICOMFramesIntoLeftPanel Exception:" + e.getMessage();
            log.debug(ss);
            e.printStackTrace();
        }

        if (bufferedImage != null) {
            updateImage(imageLabel, 0);  // Load the first frame into the left panel
            showControlButtons(imageLabel, totalFrames > 1);  // Add control buttons and slider
        }
    }

    private byte[] readFileToByteArray(File file) throws IOException {
        ByteArrayOutputStream bos = null;
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            bos = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                bos.write(buffer, 0, bytesRead);
            }
        } catch (Exception e) {
            String ss = "Class : DICOMToImageConverter  Method  : readFileToByteArray() Exception:" + e.getMessage();
            log.debug(ss);
            e.printStackTrace();
        }
        return bos.toByteArray();

    }

    public void showControlButtons(final JLabel imageLabel, boolean show) {

        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
        frame = (JFrame) SwingUtilities.getWindowAncestor(imageLabel);
        controlsPanel.setLayout(new BorderLayout());
        controlsPanel.setLayout(new BoxLayout(controlsPanel, BoxLayout.X_AXIS));
        controlsPanel.setPreferredSize(new Dimension(frame.getWidth() / 2, 30));
        if (show) {
            controlsPanel.removeAll();  // Remove all components
            controlsPanel.setBorder(null);  // Optionally remove the border
            controlsPanel.revalidate();
            controlsPanel.repaint();
            playButton = new JButton("Play");
            stopButton = new JButton("Stop");
            slider = new JSlider(0, totalFrames - 1, 0);
            playButton.setBackground(Color.blue);
            playButton.setForeground(Color.WHITE);
            stopButton.setBackground(Color.blue);
            stopButton.setForeground(Color.WHITE);
            slider.setBackground(Color.GRAY);
            slider.setForeground(Color.WHITE);
            controlsPanel.add(Box.createHorizontalStrut(frame.getWidth() / 2 - 200));
            controlsPanel.add(playButton);
            controlsPanel.add(Box.createHorizontalStrut(10));
            controlsPanel.add(stopButton);
            controlsPanel.add(Box.createHorizontalStrut(10));
            controlsPanel.add(slider);
            controlsPanel.add(Box.createHorizontalGlue());
            // Play button action
            playButton.addActionListener(new ActionListener() {

                @Override
                public void actionPerformed(ActionEvent e) {
                    if (frameTimer == null) {
                        startFrameAnimation(imageLabel); // Start animation if not already running
                    }
                }
            });

            stopButton.addActionListener(new ActionListener() {

                @Override
                public void actionPerformed(ActionEvent e) {
                    stopFrameAnimation();
                }
            });

            // Slider movement action
            slider.addChangeListener(new ChangeListener() {

                @Override
                public void stateChanged(ChangeEvent e) {
                    if (!slider.getValueIsAdjusting()) { // Only respond when user stops dragging
                        int frameIndex = slider.getValue();
                        if (frameIndex > totalFrames) {
                            stopFrameAnimation();
                        } else {
                            updateImage(imageLabel, frameIndex);
                            currentFrame = frameIndex; // Update current frame to slider's position
                        }
                    }
                }
            });
        } else {

            controlsPanel.removeAll();  // Remove all components
            controlsPanel.setBorder(null);  // Optionally remove the border
            controlsPanel.revalidate();
            controlsPanel.repaint();


        }

    }

    public void updateImage(JLabel label, int frameIndex) {
        int labelWidth = (frame.getWidth() / 3) * 2 + 30;
        int labelHeight = (frame.getHeight() / 3) * 2 + 130;
        if (frameIndex >= 0 && frameIndex < totalFrames) {
            BufferedImage bufferedImage = frames[frameIndex];
            currentImage = bufferedImage;
            Image scaledImage = bufferedImage.getScaledInstance(labelWidth, labelHeight, Image.SCALE_SMOOTH);
            label.setIcon(new ImageIcon(scaledImage));
            leftPanel.revalidate();
            leftPanel.repaint();
        }
    }

    private void startFrameAnimation(final JLabel label) {
        frameTimer = new Timer();
        frameTimer.schedule(new TimerTask() {

            @Override
            public void run() {
                if (currentFrame < totalFrames) {
                    updateImage(label, currentFrame);
                    slider.setValue(currentFrame); // Synchronize the slider with the current frame
                    currentFrame++;
                    if (currentFrame >= totalFrames) {
                        stopFrameAnimation();
                        currentFrame = 0; // Loop back to the first frame if desired
                    }
                } else {
                    stopFrameAnimation(); // Stop if out of frames
                }
            }
        }, 0, 500);  // Play each frame every 500ms
    }

    private void stopFrameAnimation() {
        if (frameTimer != null) {
            frameTimer.cancel();
            frameTimer = null;
        }


    }
   
    class ZoomWorker extends SwingWorker<BufferedImage, Void> {
        private final double scaleFactor;
        public ZoomWorker(double scaleFactor) {
            this.scaleFactor = scaleFactor;
        }
        @Override
        protected BufferedImage doInBackground() {
            return getScaledImage(currentImage, scaleFactor); // Perform scaling in background
        }
        @Override
        protected void done() {
            try {
                BufferedImage scaledImage = get(); // Get the scaled image
                imageLabel.setIcon(new ImageIcon(scaledImage)); // Update the label
                leftPanel.revalidate(); // Refresh panel
                leftPanel.repaint();
            } catch (Exception e) {
                String ss = "Class : DICOMToImageConverter  Method  : done() Exception:" + e.getMessage();
                log.debug(ss);
                e.printStackTrace();
            }
        }
    }
    private BufferedImage getScaledImage(BufferedImage originalImage, double scaleFactor) {
        int width = (int) (originalImage.getWidth() * scaleFactor);
        int height = (int) (originalImage.getHeight() * scaleFactor);
        BufferedImage scaledImage = new BufferedImage(width, height, originalImage.getType());

        Graphics2D g2d = scaledImage.createGraphics();
        AffineTransform at = AffineTransform.getScaleInstance(scaleFactor, scaleFactor);
        g2d.drawRenderedImage(originalImage, at);
        g2d.dispose();

        return scaledImage;
    }

    JDialog reportDialog = null;
    JLabel headerLabel = null;
    JLabel findingsLabel = null;
    JLabel impressionsLabel = null;
    JLabel recommendationsLabel = null;
    JLabel measurementLabel = null;
    JLabel additionalLabel = null;
    JLabel observationLabel = null;
    JLabel sequenceLabel = null;
    JScrollPane findingsScroll = null;
    JScrollPane impressionsScroll = null;
    JScrollPane recommendationsScroll = null;
    JScrollPane measurementScroll = null;
    JScrollPane additionalScroll = null;
    JScrollPane observationScroll = null;
    JScrollPane sequenceScroll = null;
    JTextArea findingsText = null;
    JTextArea impressionsText = null;
    JTextArea recommendationsText = null;
    JTextArea measurementText = null;
    JTextArea additinalText = null;
    JTextArea observationText = null;
    JTextArea sequenceText = null;

    private void openReportDialog(final DicomModel dicomModel, final int type, final Date todayDate) {
        try {
            if (currentFiles == null) {
                JOptionPane.showMessageDialog(frame, "Please select a DICOM file to create/edit a report.", "Information", JOptionPane.INFORMATION_MESSAGE);
                return;
            }

            getDicomModelData(dicomModel, todayDate);
            String dicomFilePath = currentFiles.getAbsolutePath();
            final DicomImplementation dicomCon = new DicomController();
            switch (type) {
                case 1:
                    reportDialog = new JDialog(frame, "X-Ray Report", true);
                    headerLabel = new JLabel("X-Ray Report", SwingConstants.CENTER);
                    break;
                case 2:
                    reportDialog = new JDialog(frame, "Ultrasound Report", true);
                    headerLabel = new JLabel("Ultrasound Report", SwingConstants.CENTER);
                    break;
                case 3:
                    reportDialog = new JDialog(frame, "Electrocardiogram Report", true);
                    headerLabel = new JLabel("Electrocardiogram Report", SwingConstants.CENTER);
                    break;
                case 4:
                    reportDialog = new JDialog(frame, "Echocardiography Report", true);
                    headerLabel = new JLabel("Echocardiography Report", SwingConstants.CENTER);
                    break;
                case 5:
                    reportDialog = new JDialog(frame, "Computed Tomography Report", true);
                    headerLabel = new JLabel("Computed Tomography Report", SwingConstants.CENTER);
                    break;

                case 6:
                    reportDialog = new JDialog(frame, "Magnetic Resonance Imaging", true);
                    headerLabel = new JLabel("Magnetic Resonance Imaging", SwingConstants.CENTER);
                    break;


            }
            // Create a modal dialog

            reportDialog.setSize(500, 600);
            reportDialog.setLayout(new BorderLayout());

            // Header

            headerLabel.setFont(new Font("Arial", Font.BOLD, 24));
            reportDialog.add(headerLabel, BorderLayout.NORTH);

            // Center panel with labels and text areas
            JPanel centerPanel = new JPanel();
            centerPanel.setLayout(new BoxLayout(centerPanel, BoxLayout.Y_AXIS));
            centerPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));


            // Findings
            findingsLabel = new JLabel("Findings:");
            findingsText = new JTextArea(5, 40);
            findingsText.setLineWrap(true);
            findingsText.setWrapStyleWord(true);
            findingsScroll = new JScrollPane(findingsText);

            // Impressions
            impressionsLabel = new JLabel("Impressions:");
            impressionsText = new JTextArea(5, 40);
            impressionsText.setLineWrap(true);
            impressionsText.setWrapStyleWord(true);
            impressionsScroll = new JScrollPane(impressionsText);

            sequenceLabel = new JLabel("Sequence:");
            sequenceText = new JTextArea(5, 40);
            sequenceText.setLineWrap(true);
            sequenceText.setWrapStyleWord(true);
            sequenceScroll = new JScrollPane(sequenceText);

            // Recommendations
            recommendationsLabel = new JLabel("Recommendations:");
            recommendationsText = new JTextArea(5, 40);
            recommendationsText.setLineWrap(true);
            recommendationsText.setWrapStyleWord(true);
            recommendationsScroll = new JScrollPane(recommendationsText);
            if (type == 2 || type == 4) {

                measurementLabel = new JLabel("Measurement:");
                measurementText = new JTextArea(5, 40);
                measurementText.setLineWrap(true);
                measurementText.setWrapStyleWord(true);
                measurementScroll = new JScrollPane(measurementText);
            }
            if (type == 2) {

                additionalLabel = new JLabel("Additional Notes:");
                additinalText = new JTextArea(5, 40);
                additinalText.setLineWrap(true);
                additinalText.setWrapStyleWord(true);
                additionalScroll = new JScrollPane(additinalText);
            }
            observationLabel = new JLabel("Obervation Notes:");
            observationText = new JTextArea(5, 40);
            observationText.setLineWrap(true);
            observationText.setWrapStyleWord(true);
            observationScroll = new JScrollPane(observationText);

            centerPanel.add(findingsLabel);
            centerPanel.add(findingsScroll);
            centerPanel.add(Box.createVerticalStrut(10)); // Spacer
            centerPanel.add(impressionsLabel);
            centerPanel.add(impressionsScroll);

            centerPanel.add(Box.createVerticalStrut(10)); // Spacer
            if (type == 2 || type == 4) {
                centerPanel.add(measurementLabel);
                centerPanel.add(measurementScroll);
                centerPanel.add(Box.createVerticalStrut(10)); // Spacer
            }
            if (type == 5) {
                centerPanel.add(observationLabel);
                centerPanel.add(observationScroll);
                centerPanel.add(Box.createVerticalStrut(10)); // Spacer
            }
            if (type == 6) {
                centerPanel.add(sequenceLabel);
                centerPanel.add(sequenceScroll);
                centerPanel.add(Box.createVerticalStrut(10)); // Spacer
            }
            centerPanel.add(recommendationsLabel);
            centerPanel.add(recommendationsScroll);
            if (type == 2) {
                centerPanel.add(Box.createVerticalStrut(10)); // Spacer
                centerPanel.add(additionalLabel);
                centerPanel.add(additionalScroll);
            }
            reportDialog.add(centerPanel, BorderLayout.CENTER);

            // Save and Cancel buttons
            JPanel buttonPanel = new JPanel();
            buttonPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));

            JButton saveReportButton = new JButton("Save Report");
            JButton cancelButton = new JButton("Cancel");

            buttonPanel.add(saveReportButton);
            buttonPanel.add(cancelButton);

            reportDialog.add(buttonPanel, BorderLayout.SOUTH);
            saveReportButton.addActionListener(new ActionListener() {

                private boolean succ = false;

                public void actionPerformed(ActionEvent e) {
                    try {
                        switch (type) {
                            case 1:
                                findings = findingsText.getText().trim();
                                impressions = impressionsText.getText().trim();
                                recommendations = recommendationsText.getText().trim();
                                dicomModel.setFinding(findings);
                                dicomModel.setImpression(impressions);
                                dicomModel.setRecommendation(recommendations);
                                dicomModel.setCurrentDate(todayDate);
                                if (findings.length() == 0 || impressions.length() == 0 || recommendations.length() == 0) {
                                    JOptionPane.showMessageDialog(reportDialog, "All fields must be filled.", "Input Error", JOptionPane.ERROR_MESSAGE);
                                    return;
                                }

                                succ = dicomCon.updateRecord(dicomModel, 1);
                                break;

                            case 2:
                                findings = findingsText.getText().trim();
                                impressions = impressionsText.getText().trim();
                                measurements = measurementText.getText().trim();
                                recommendations = recommendationsText.getText().trim();
                                additionalNotes = additinalText.getText().trim();
                                dicomModel.setCurrentDate(todayDate);
                                dicomModel.setFinding(findings);
                                dicomModel.setImpression(impressions);
                                dicomModel.setMeasurements(measurements);
                                dicomModel.setRecommendation(recommendations);
                                dicomModel.setAdditionalNotes(additionalNotes);

                                if (findings.length() == 0 || impressions.length() == 0 || recommendations.length() == 0) {
                                    JOptionPane.showMessageDialog(reportDialog, "All fields must be filled.", "Input Error", JOptionPane.ERROR_MESSAGE);
                                    return;
                                }
                                succ = dicomCon.updateRecord(dicomModel, 2);
                                break;

                            case 4:
                                findings = findingsText.getText().trim();
                                impressions = impressionsText.getText().trim();
                                measurements = measurementText.getText().trim();
                                recommendations = recommendationsText.getText().trim();
                                dicomModel.setCurrentDate(todayDate);
                                dicomModel.setFinding(findings);
                                dicomModel.setImpression(impressions);
                                dicomModel.setMeasurements(measurements);
                                dicomModel.setRecommendation(recommendations);

                                if (findings.length() == 0 || impressions.length() == 0 || recommendations.length() == 0) {
                                    JOptionPane.showMessageDialog(reportDialog, "All fields must be filled.", "Input Error", JOptionPane.ERROR_MESSAGE);
                                    return;
                                }
                                succ = dicomCon.updateRecord(dicomModel, 4);
                                break;


                            case 5:
                                findings = findingsText.getText().trim();
                                impressions = impressionsText.getText().trim();
                                observation = observationText.getText().trim();
                                recommendations = recommendationsText.getText().trim();
                                dicomModel.setCurrentDate(todayDate);
                                dicomModel.setFinding(findings);
                                dicomModel.setImpression(impressions);
                                dicomModel.setObservation(observation);
                                dicomModel.setRecommendation(recommendations);


                                if (findings.length() == 0 || impressions.length() == 0 || recommendations.length() == 0) {
                                    JOptionPane.showMessageDialog(reportDialog, "All fields must be filled.", "Input Error", JOptionPane.ERROR_MESSAGE);
                                    return;
                                }
                                succ = dicomCon.updateRecord(dicomModel, 5);
                                break;

                            case 6:
                                findings = findingsText.getText().trim();
                                impressions = impressionsText.getText().trim();
                                sequence = sequenceText.getText().trim();
                                recommendations = recommendationsText.getText().trim();
                                dicomModel.setCurrentDate(todayDate);
                                dicomModel.setFinding(findings);
                                dicomModel.setImpression(impressions);
                                dicomModel.setSequences(sequence);
                                dicomModel.setRecommendation(recommendations);


                                if (findings.length() == 0 || impressions.length() == 0 || recommendations.length() == 0) {
                                    JOptionPane.showMessageDialog(reportDialog, "All fields must be filled.", "Input Error", JOptionPane.ERROR_MESSAGE);
                                    return;
                                }
                                succ = dicomCon.updateRecord(dicomModel, 6);
                                break;

                        }

                      if (succ) {
                            JOptionPane.showMessageDialog(reportDialog, "Report saved successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);

                            reportDialog.dispose();
                        }
                    } catch (Exception ex) {
                        JOptionPane.showMessageDialog(reportDialog, "Error saving report: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                        String ss = "Class : DICOMToImageConverter  Method  : openReportDialog() Exception:" + ex.getMessage();
                        log.debug(ss);
                        ex.printStackTrace();
                    }

                }
            });
            cancelButton.addActionListener(new ActionListener() {
                public void actionPerformed(ActionEvent e) {
                    reportDialog.dispose();
                }
            });
            reportDialog.setLocationRelativeTo(frame);
            reportDialog.setVisible(true);
        } catch (Exception e) {
            String ss = "Class : DICOMToImageConverter  Method  : openReportDialog() Exception:" + e.getMessage();
            log.debug(ss);
            e.printStackTrace();
        }
    }
}
