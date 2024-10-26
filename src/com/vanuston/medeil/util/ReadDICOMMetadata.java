/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.util;
import java.io.File;
import org.dcm4che3.data.Attributes;
import org.dcm4che3.data.Tag;
import org.dcm4che3.io.DicomInputStream;



/**
 *
 * @author Vanitha
 */
public class ReadDICOMMetadata {


public String readMetadata(File dicomFile, String str) {
        DicomInputStream dis = null;

        try {
            dis = new DicomInputStream(dicomFile);
            Attributes attributes = dis.readDataset(-1, -1);
            // Print or process attributes
            if (str.equals("patientName")) {
                str = attributes.getString(Tag.PatientName);
            } else if (str.equals("modality")) {
                str = attributes.getString(Tag.Modality);
            } else if (str.equals("patientID")) {
                str = attributes.getString(Tag.PatientID);
            } else if (str.equals("patientBOD")) {
                str = attributes.getString(Tag.PatientBirthDate);
            } else if (str.equals("patientSex")) {
                str = attributes.getString(Tag.PatientSex);
            } else if (str.equals("specificCharacterSet")) {
                str = attributes.getString(Tag.SpecificCharacterSet);
            } else if (str.equals("imageType")) {
                str = attributes.getString(Tag.ImageType);
            } else if (str.equals("instanceCreationDate")) {
                str = attributes.getString(Tag.InstanceCreationDate);
            } else if (str.equals("instanceCreationTime")) {
                str = attributes.getString(Tag.InstanceCreationTime);
            } else if (str.equals("sopClassUID")) {
                str = attributes.getString(Tag.SOPClassUID);
            } else if (str.equals("sopInstanceUID")) {
                str = attributes.getString(Tag.SOPInstanceUID);
            } else if (str.equals("studyDate")) {
                str = attributes.getString(Tag.StudyDate);
            } else if (str.equals("acquisitionDate")) {
                str = attributes.getString(Tag.AcquisitionDate);
            } else if (str.equals("contentDate")) {
                str = attributes.getString(Tag.ContentDate);
            } else if (str.equals("studyTime")) {
                str = attributes.getString(Tag.StudyTime);
            } else if (str.equals("acquisitionTime")) {
                str = attributes.getString(Tag.AcquisitionTime);
            } else if (str.equals("contentTime")) {
                str = attributes.getString(Tag.ContentTime);
            } else if (str.equals("studyDescription")) {
                str = attributes.getString(Tag.StudyDescription);
            } else if (str.equals("procedureCodeSequence")) {
                str = attributes.getString(Tag.ProcedureCodeSequence);
            } else if (str.equals("seriesDescription")) {
                str = attributes.getString(Tag.SeriesDescription);
            } else if (str.equals("referencedPerformedProcedureStepSequence")) {
                str = attributes.getString(Tag.ReferencedPerformedProcedureStepSequence);


            } else if (str.equals("contrastBolusAgent")) {
                str = attributes.getString(Tag.ContrastBolusAgent);

            } else if (str.equals("scanOptions")) {
                str = attributes.getString(Tag.ScanOptions);

            } else if (str.equals("sliceThickness")) {
                str = attributes.getString(Tag.SliceThickness);

            } else if (str.equals("spacingBetweenSlices")) {
                str = attributes.getString(Tag.SpacingBetweenSlices);


            } else if (str.equals("kVP")) {
                str = attributes.getString(Tag.KVP);

            } else if (str.equals("dataCollectionDiameter")) {
                str = attributes.getString(Tag.DataCollectionDiameter);

            } else if (str.equals("protocolName")) {
                str = attributes.getString(Tag.ProtocolName);

            } else if (str.equals("reconstructionDiameter")) {
                str = attributes.getString(Tag.ReconstructionDiameter);

            } else if (str.equals("gantryDetectorTilt")) {
                str = attributes.getString(Tag.GantryDetectorTilt);
            } else if (str.equals("tableHeight")) {
                str = attributes.getString(Tag.TableHeight);
            } else if (str.equals("rotationDirection")) {
                str = attributes.getString(Tag.RotationDirection);
            } else if (str.equals("xRayTubeCurrent")) {
                str = attributes.getString(Tag.XRayTubeCurrent);
            } else if (str.equals("exposure")) {
                str = attributes.getString(Tag.Exposure);
            } else if (str.equals("filterType")) {
                str = attributes.getString(Tag.FilterType);
            } else if (str.equals("convolutionKernel")) {
                str = attributes.getString(Tag.ConvolutionKernel);
            } else if (str.equals("patientPosition")) {
                str = attributes.getString(Tag.PatientPosition);
            } else if (str.equals("studyInstanceUID")) {
                str = attributes.getString(Tag.StudyInstanceUID);
            } else if (str.equals("seriesInstanceUID")) {
                str = attributes.getString(Tag.SeriesInstanceUID);
            } else if (str.equals("seriesNumber")) {
                str = attributes.getString(Tag.SeriesNumber);
            } else if (str.equals("instanceNumber")) {
                str = attributes.getString(Tag.InstanceNumber);
            } else if (str.equals("imagePositionPatient")) {
                str = attributes.getString(Tag.ImagePositionPatient);
            } else if (str.equals("imageOrientationPatient")) {
                str = attributes.getString(Tag.ImageOrientationPatient);
            } else if (str.equals("frameOfReferenceUID")) {
                str = attributes.getString(Tag.FrameOfReferenceUID);
            } else if (str.equals("sliceLocation")) {
                str = attributes.getString(Tag.SliceLocation);
            } else if (str.equals("imageComments")) {
                str = attributes.getString(Tag.ImageComments);
            } else if (str.equals("samplesPerPixel")) {
                str = attributes.getString(Tag.SamplesPerPixel);
            } else if (str.equals("photometricInterpretation")) {
                str = attributes.getString(Tag.PhotometricInterpretation);
            } else if (str.equals("rows")) {
                str = attributes.getString(Tag.Rows);
            } else if (str.equals("columns")) {
                str = attributes.getString(Tag.Columns);
            } else if (str.equals("pixelSpacing")) {
                str = attributes.getString(Tag.PixelSpacing);
            } else if (str.equals("bitsAllocated")) {
                str = attributes.getString(Tag.BitsAllocated);
            } else if (str.equals("bitsStored")) {
                str = attributes.getString(Tag.BitsStored);
            } else if (str.equals("highBit")) {
                str = attributes.getString(Tag.HighBit);
            } else if (str.equals("pixelRepresentation")) {
                str = attributes.getString(Tag.PixelRepresentation);
            } else if (str.equals("windowCenter")) {
                str = attributes.getString(Tag.WindowCenter);
            } else if (str.equals("windowWidth")) {
                str = attributes.getString(Tag.WindowWidth);
            } else if (str.equals("rescaleIntercept")) {
                str = attributes.getString(Tag.RescaleIntercept);
            } else if (str.equals("rescaleSlope")) {
                str = attributes.getString(Tag.RescaleSlope);
            } else if (str.equals("lossyImageCompression")) {
                str = attributes.getString(Tag.LossyImageCompression);
            } else if (str.equals("lossyImageCompressionRatio")) {
                str = attributes.getString(Tag.LossyImageCompressionRatio);
            } else if (str.equals("scheduledProcedureStepDescription")) {
                str = attributes.getString(Tag.ScheduledProcedureStepDescription);
            } else if (str.equals("scheduledProtocolCodeSequence")) {
                str = attributes.getString(Tag.ScheduledProtocolCodeSequence);
            } else if (str.equals("scheduledProcedureStepID")) {
                str = attributes.getString(Tag.ScheduledProcedureStepID);
            } else if (str.equals("performedProcedureStepDescription")) {
                str = attributes.getString(Tag.PerformedProcedureStepDescription);
            } else if (str.equals("performedProtocolCodeSequence")) {
                str = attributes.getString(Tag.PerformedProtocolCodeSequence);
            } else if (str.equals("requestAttributesSequence")) {
                str = attributes.getString(Tag.RequestAttributesSequence);
            } else if (str.equals("requestedProcedureID")) {
                str = attributes.getString(Tag.RequestedProcedureID);
            } else if (str.equals("PixelData")) {
                str = attributes.getString(Tag.PixelData);
            }
          else if(str.equals("patientTelephoneNumbers")){
                str=attributes.getString(Tag.PatientTelephoneNumbers);
          }
            else if(str.equals("personTelephoneNumbers")){
                str=attributes.getString(Tag.PersonTelephoneNumbers);
          }
//          else if(str.equals("kVP")){
//                str=attributes.getString(Tag.KVP);
//          }else if(str.equals("kVP")){
//                str=attributes.getString(Tag.KVP);
//          }else if(str.equals("kVP")){
//                str=attributes.getString(Tag.KVP);
//          }




            System.out.println("Patient Name: " + attributes.getString(Tag.PatientName));
            System.out.println("Modality: " + attributes.getString(Tag.Modality));

        } catch (Exception e) {
            e.printStackTrace();
        }

        return str;
    }
}
