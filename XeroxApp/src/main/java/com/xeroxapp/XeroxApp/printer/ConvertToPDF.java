// package com.xeroxapp.XeroxApp.printer;

// import org.apache.pdfbox.pdmodel.PDDocument;
// import org.apache.pdfbox.pdmodel.PDPage;
// import org.apache.pdfbox.pdmodel.PDPageContentStream;
// import org.apache.pdfbox.pdmodel.font.PDType1Font;
// import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
// import org.apache.poi.common.usermodel.PictureType;
// import org.apache.poi.xwpf.usermodel.XWPFDocument;
// import org.apache.poi.xwpf.usermodel.XWPFPictureData;
// import org.springframework.stereotype.Service;
// import org.springframework.web.multipart.MultipartFile;

// import java.io.*;

// @Service
// public class ConvertToPDF {
// public void convertToPdf(MultipartFile inputFile, File outputFile) throws
// IOException {
// if (inputFile.getContentType().equals("text/plain")) {
// try (BufferedReader reader = new BufferedReader(new
// InputStreamReader(inputFile.getInputStream()));
// OutputStream pdfOutputStream = new FileOutputStream(outputFile)) {

// PDDocument document = new PDDocument();
// PDPage page = new PDPage();
// document.addPage(page);

// String line;
// try (PDPageContentStream contentStream = new PDPageContentStream(document,
// page)) {
// while ((line = reader.readLine()) != null) {
// contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);
// contentStream.newLineAtOffset(100, 700);
// contentStream.showText(line);
// contentStream.newLineAtOffset(0, -20);
// }
// }

// document.save(pdfOutputStream);
// document.close();
// }
// } else if (inputFile.getContentType().equals("application/msword") ||
// inputFile.getContentType()
// .equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document"))
// {
// try (InputStream inputStream = inputFile.getInputStream();
// OutputStream pdfOutputStream = new FileOutputStream(outputFile)) {

// XWPFDocument doc = new XWPFDocument(inputStream);

// PDDocument pdfDocument = new PDDocument();

// for (XWPFPictureData pic : doc.getAllPictures()) {
// if
// (pic.getPackagePart().getContentType().equals(PictureType.PNG.getContentType()))
// {
// byte[] bytes = pic.getData();
// PDPage page = new PDPage();
// pdfDocument.addPage(page);
// try (PDPageContentStream contentStream = new PDPageContentStream(pdfDocument,
// page)) {
// PDImageXObject imageXObject = PDImageXObject.createFromByteArray(pdfDocument,
// bytes,
// "image.png");
// contentStream.drawImage(imageXObject, 0, 0);
// }
// }
// }

// pdfDocument.save(pdfOutputStream);
// pdfDocument.close();
// doc.close();
// }
// } else {
// // Handle conversion for other file types (e.g., Word documents) here.
// // You may need to use additional libraries or tools to perform these
// // conversions.
// // Ensure that the converted PDF is written to the outputFile.
// }
// }
// }
