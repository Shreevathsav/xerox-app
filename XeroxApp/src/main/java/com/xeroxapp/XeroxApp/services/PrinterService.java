package com.xeroxapp.XeroxApp.services;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.firebase.messaging.FirebaseMessagingException;
import com.xeroxapp.XeroxApp.config.JwtService;
import com.xeroxapp.XeroxApp.orders.OrderRepository;
import com.xeroxapp.XeroxApp.orders.Orders;
import com.xeroxapp.XeroxApp.printer.PrinterJobService;
import com.xeroxapp.XeroxApp.user.User;
import com.xeroxapp.XeroxApp.user.UserRepository;

import io.jsonwebtoken.io.IOException;
import lombok.RequiredArgsConstructor;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Service
@RequiredArgsConstructor
public class PrinterService {

    @Autowired
    PrinterJobService printerJobService;

    private final OrderRepository orderRepository;
    public static final String UPLOAD_DIR = "FileSystem";
    @Autowired
    JwtService jwtService;

    private final UserRepository repository;

    public boolean printService(String fileName, MultipartFile document, boolean isPaid, String token) {
        try {
            String jwtToken = token.substring(7);
            System.out.println(" orderservices token : " + jwtToken);
            String userName = jwtService.extractUsername(jwtToken);
            User user = repository.findByEmail(userName).orElseThrow();
            String filePath = storeFile(document, fileName);
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy", java.util.Locale.ENGLISH);
            String currentDateString = currentDate.format(formatter);
            var order = Orders.builder()
                    .user(user)
                    .fileName(fileName)
                    .filePath(filePath)
                    .isPaid(isPaid)
                    .isOrderFullfilled(false)
                    .dateTime(currentDateString)
                    .build();
            orderRepository.save(order);
            printFile(filePath, user.getFcmToken());
            return true;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return false;
    }

    @Async
    public void printFile(String filePath, String FCMapitoken) throws FirebaseMessagingException {
        printerJobService.printerService(filePath, FCMapitoken);
    }

    public static String storeFile(MultipartFile file, String fileName) throws IOException, java.io.IOException {
        try {
            String projectDirectory = System.getProperty("user.dir");
            File directory = new File(projectDirectory, UPLOAD_DIR);
            if (!directory.exists()) {
                directory.mkdirs();
            }
            System.out.println(directory.getPath().toString());
            String originalFileName = file.getOriginalFilename();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
            String formattedDate = dateFormat.format(new Date());
            String fileNameWithDate = originalFileName.replace(fileExtension, "_" + formattedDate + fileExtension);

            // Save the file to the upload directory
            File destFile = new File(directory + File.separator + fileNameWithDate);
            file.transferTo(destFile);

            return destFile.toPath().toString();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}
