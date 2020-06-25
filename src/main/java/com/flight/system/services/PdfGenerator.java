package com.flight.system.services;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import com.itextpdf.forms.PdfAcroForm;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;

public class PdfGenerator {
	
	
	
	public static void main(String arg[]) throws FileNotFoundException, IOException {
		File file= new File("/templates/form.pdf");
		
		File file2=new File("/home/shivam/Documents/workspace-spring-tool-suite-4-4.6.2.RELEASE/flight-System/src/main/resources/templates/airTicketTempletNew.pdf");
		
		PdfReader pdfReader= new PdfReader(file);
		PdfWriter pdfWriter= new PdfWriter(file2);
		PdfDocument document= new PdfDocument(pdfReader, pdfWriter);
		PdfAcroForm acroForm= PdfAcroForm.getAcroForm(document, true);
		System.out.println(acroForm.getFormFields().keySet());
	}

}
