using System;

class Program
{
    static void Main(string[] args)
    {
        DocumentFactory factory;

        factory = new WordDocumentFactory();
        IDocument wordDoc = factory.CreateDocument();
        wordDoc.Open();

        factory = new PdfDocumentFactory();
        IDocument pdfDoc = factory.CreateDocument();
        pdfDoc.Open();

        factory = new ExcelDocumentFactory();
        IDocument excelDoc = factory.CreateDocument();
        excelDoc.Open();
    }
}
