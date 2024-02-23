package com.xeroxapp.XeroxApp.printer;

import org.springframework.stereotype.Service;

import javax.print.PrintService;
import javax.print.attribute.Attribute;
import javax.print.attribute.AttributeSet;

@Service
public class SelectPrinter {
    public PrintService selectPrinter(PrintService[] printers, String selectedPrinter) {
        for(PrintService printer:printers){
            AttributeSet attributes = printer.getAttributes();
            Attribute printerName = attributes.get(javax.print.attribute.standard.PrinterName.class);
            String printerNameValue = printerName.toString().toLowerCase();
            if(selectedPrinter.equals(printerNameValue)){
                return printer;
            }
        }
        return null;
    }
}
