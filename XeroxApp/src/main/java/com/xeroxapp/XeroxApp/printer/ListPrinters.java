package com.xeroxapp.XeroxApp.printer;

import org.json.JSONArray;
import org.springframework.stereotype.Service;

import javax.print.PrintService;
import javax.print.attribute.Attribute;
import javax.print.attribute.AttributeSet;
import java.awt.print.PrinterJob;

@Service
public class ListPrinters {
    public JSONArray listPrinters() {
        PrintService[] printServices = PrinterJob.lookupPrintServices();
        JSONArray printers = new JSONArray();
        for (PrintService printer : printServices) {
            AttributeSet attributes = printer.getAttributes();
            Attribute printerName = attributes.get(javax.print.attribute.standard.PrinterName.class);
            if (printerName != null) {
                String printerNameValue = printerName.toString().toLowerCase();
                printers.put(printerNameValue);
            }
        }
        return printers;
    }

}
