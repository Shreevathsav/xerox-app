package com.xeroxapp.XeroxApp.printer;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.printing.PDFPageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.firebase.messaging.FirebaseMessagingException;
import com.xeroxapp.XeroxApp.services.FirebaseMessagingService;
import com.xeroxapp.XeroxApp.services.OrderServices;

import javax.print.PrintService;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.File;
import java.io.IOException;

@Service
public class PrinterJobService {

    @Autowired
    SelectPrinter mSelectPrinter;

    @Autowired
    FirebaseMessagingService vfFirebaseMessagingService;

    // @Autowired
    // OrderServices orderServices;

    public String printerService(String fileName, String FCMapitoken) throws FirebaseMessagingException {
        try {
            File tempPdfFile = new File(fileName);
            // Load the PDF document
            PDDocument document = PDDocument.load(tempPdfFile);

            PDFPageable pageable = new PDFPageable(document);
            // orderServices.markOrderAsFulfilled(null);
            vfFirebaseMessagingService.sendNotification("Print done", FCMapitoken);
            PrintService[] printServices = PrinterJob.lookupPrintServices();
            System.out.println(printServices.toString());
            // if (printServices.length > 0) {
            // System.out.println("Printer available " + printServices[0].getName());
            // PrintService printer = mSelectPrinter.selectPrinter(printServices,
            // printServices[0].getName());

            // PrinterJob printerJob = PrinterJob.getPrinterJob();
            // printerJob.setPageable(pageable);
            // printerJob.setPrintService(printer);
            // printerJob.print();

            // document.close();

            // return "Document printed successfully!";
            // } else {
            // return "No printers available.";
            // }
            return "done";
        } catch (IOException e) {
            e.printStackTrace();
            return "Error printing the document: " + e.getMessage();
        }
    }
}
