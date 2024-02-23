package com.xeroxapp.XeroxApp.xeroxapp;

import com.xeroxapp.XeroxApp.printer.ListPrinters;
import com.xeroxapp.XeroxApp.services.PrinterService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@PreAuthorize("hasRole('ROLE_USER')")
@RequestMapping("/api/v1")
public class PrinterController {

    @Autowired
    PrinterService mPrinterService;

    @Autowired
    ListPrinters listPrinters;

    @PostMapping("/print")
    public ResponseEntity<Boolean> uploadFile(
            @RequestParam("fileName") String fileName,
            @RequestParam("document") MultipartFile document,
            @RequestParam("isPaid") boolean isPaid,
            @RequestHeader("Authorization") String token) {
        if (document.isEmpty()) {
            return ResponseEntity.badRequest().body(false);
        }

        boolean response = mPrinterService.printService(fileName, document, isPaid, token);
        return ResponseEntity.ok(response);
    }

    // @GetMapping("/getPrinters")
    // public JSONArray getPrinters() {
    // JSONArray response = listPrinters.listPrinters();
    // return response;
    // }
}
