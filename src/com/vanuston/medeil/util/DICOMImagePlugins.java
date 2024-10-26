/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.util;

import javax.imageio.spi.ImageReaderSpi;
import javax.imageio.spi.IIORegistry;
import java.util.Iterator;

/**
 *
 * @author Vanitha
 */
public class DICOMImagePlugins {

    public void checkImageIOPlugins() {
        IIORegistry registry = IIORegistry.getDefaultInstance();
        Iterator<ImageReaderSpi> readers = registry.getServiceProviders(ImageReaderSpi.class, true);

        System.out.println("Registered Image Reader SPIs:");
        while (readers.hasNext()) {
            ImageReaderSpi readerSpi = readers.next();
            System.out.println("Reader: " + readerSpi.getDescription(null));
        }
    }
}
